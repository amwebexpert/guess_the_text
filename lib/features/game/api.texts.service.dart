import 'dart:convert' as convert;
import 'dart:io';

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
      String data = await _callCachedApi(url: url, cacheFile: 'about-info.json');
      Map<String, dynamic> body = convert.jsonDecode(data);

      return ApiAbout.fromJson(body);
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

    String data = await _callCachedApi(url: url, cacheFile: 'categories.json');
    List array = convert.jsonDecode(data);

    _categories = array.map((it) => ApiCategory.fromJson(it)).toList();
    return _categories;
  }

  Future<List<ApiText>> getTexts(String categoryUuid) async {
    if (categoryUuid.isBlank) {
      return [];
    }

    if (_lastCategoryUuid == categoryUuid) {
      return _texts;
    }

    String entriesUrl = '$apiPathCategories/$categoryUuid/texts';
    Uri url = Uri.https(hostName, entriesUrl);

    String data = await _callCachedApi(url: url, cacheFile: 'category-$categoryUuid-texts.json');
    List array = convert.jsonDecode(data);

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
      String data = response.body;

      if (cacheFile.isNotBlank) {
        cacheData(data: data, cacheFile: cacheFile!);
      }

      return data;
    } catch (e) {
      logger.error('Request failed', e);
      rethrow;
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

  void cacheData({required String data, required String cacheFile}) async {
    File file = await fileService.write(data: data, filename: cacheFile, directoryType: DirectoryType.appSupport);
    logger.info('file write succeeded: ${file.absolute}');
  }
}
