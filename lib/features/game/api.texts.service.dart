import 'dart:async';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:guess_the_text/features/about/api.about.model.dart';
import 'package:guess_the_text/features/categories/api.category.model.dart';
import 'package:guess_the_text/features/game/api.text.model.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/services/file/directory.enum.dart';
import 'package:guess_the_text/services/file/file.service.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';
import 'package:guess_the_text/utils/extensions/string.extensions.dart';
import 'package:http/http.dart' as http;

class TextsService {
  final LoggerService logger = serviceLocator.get();
  final FileService fileService = serviceLocator.get();
  static final TextsService _instance = TextsService._privateConstructor();

  static const String hostName = 'amw-hangman-api.herokuapp.com';
  static const String apiPathCategories = '/api/v1/categories';
  static const String apiPathAbout = '/api/v1/about';

  // internal service cache
  List<ApiCategory> _categories = [];
  String _lastCategoryUuid = '';
  List<ApiText> _texts = [];

  factory TextsService() => _instance;
  TextsService._privateConstructor();

  Future<ApiAbout> getAboutInfo() async {
    Uri url = Uri.https(hostName, apiPathAbout);

    try {
      String jsonContent = await _callCachedApi(url: url, cacheFile: 'about-info.json');
      Map<String, dynamic> data = convert.jsonDecode(jsonContent);

      return ApiAbout.fromJson(data);
    } catch (e) {
      logger.error('About request failed', e);
      return const ApiAbout();
    }
  }

  Future<List<ApiCategory>> getCategories() async {
    if (_categories.isNotEmpty) {
      return _categories;
    }

    Uri url = Uri.https(hostName, apiPathCategories);

    String jsonContent = await _callCachedApi(url: url, cacheFile: 'categories.json');
    List array = convert.jsonDecode(jsonContent);

    _categories = array.map((it) => ApiCategory.fromJson(it)).toList();
    return _categories;
  }

  String getCategoryCacheFilename(String categoryUuid) => 'category-$categoryUuid-texts.json';

  Future<List<ApiText>> getTexts(String categoryUuid) async {
    if (categoryUuid.isBlank) {
      return [];
    }

    if (_lastCategoryUuid == categoryUuid) {
      return _texts;
    }

    String entriesUrl = '$apiPathCategories/$categoryUuid/texts';
    Uri url = Uri.https(hostName, entriesUrl);

    String jsonContent = await _callCachedApi(url: url, cacheFile: getCategoryCacheFilename(categoryUuid));
    List array = convert.jsonDecode(jsonContent);

    // memoize text items
    _lastCategoryUuid = categoryUuid;
    _texts = array.map((it) => ApiText.fromJson(it)).toList();

    return _texts;
  }

  Future<String> _callCachedApi({required Uri url, String? cacheFile}) async {
    http.Response response;

    try {
      response = await http.get(url);
      response = _validateApiResponse(response);
      String jsonContent = response.body;

      if (!kIsWeb && cacheFile.isNotBlank) {
        unawaited(cacheData(data: jsonContent, cacheFile: cacheFile!));
      }

      return jsonContent;
    } catch (e) {
      logger.error('Request failed, will try to load from "$cacheFile", url: "$url"', e);

      String jsonContent = await loadFromCache(cacheFile);
      if (jsonContent.isBlank) {
        rethrow;
      }
      return jsonContent;
    }
  }

  http.Response _validateApiResponse(http.Response response) {
    if (response.statusCode == HttpStatus.ok) {
      return response;
    }

    const message = 'Request failed with status';
    logger.error(message, response.statusCode);
    throw Exception('$message : ${response.statusCode}.');
  }

  Future<void> cacheData({required String data, required String cacheFile}) async {
    logger.info('caching data to file $cacheFile');
    File file = await fileService.write(data: data, filename: cacheFile, directoryType: DirectoryType.appSupport);
    logger.info('\tfile write succeeded: ${file.absolute}');
  }

  Future<String> loadFromCache(String? cacheFile) async {
    logger.info('loading API data from $cacheFile');
    if (kIsWeb || cacheFile.isBlank) {
      logger.info('\tno cached file');
      return '';
    }

    try {
      String jsonContent = await fileService.read(filename: cacheFile!, directoryType: DirectoryType.appSupport);
      logger.info('\treturning cached content from $cacheFile');

      return jsonContent;
    } catch (e) {
      logger.error('\texception while reading $cacheFile', e);
      return '';
    }
  }
}
