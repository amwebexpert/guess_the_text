import 'dart:convert' as convert;
import 'dart:io';

import 'package:guess_the_text/services/hangman/model/api_about.model.dart';
import 'package:guess_the_text/services/hangman/model/api_category.model.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';
import 'package:http/http.dart' as http;

import 'model/api_text.model.dart';

class TextsService {
  static final TextsService _instance = TextsService._privateConstructor();
  final LoggerService logger = LoggerService();

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
      http.Response response = await _callApi(url);
      Map<String, dynamic> body = convert.jsonDecode(response.body);

      return ApiAbout.fromJson(body);
    } catch (e) {
      logger.error('About request failed', e);
      return ApiAbout();
    }
  }

  Future<List<ApiCategory>> getCategories() async {
    if (_categories.isNotEmpty) {
      return _categories;
    }

    Uri url = Uri.https(hostName, apiPathCategories);

    http.Response response = await _callApi(url);
    List array = convert.jsonDecode(response.body);

    _categories = array.map((it) => ApiCategory.fromJson(it)).toList();
    return _categories;
  }

  Future<List<ApiText>> getTexts(String categoryUuid) async {
    if (_lastCategoryUuid == categoryUuid) {
      return _texts;
    }

    String entriesUrl = '$apiPathCategories/$categoryUuid/texts';
    Uri url = Uri.https(hostName, entriesUrl);

    http.Response response = await _callApi(url);
    List array = convert.jsonDecode(response.body);

    // memoize text items
    _lastCategoryUuid = categoryUuid;
    _texts = array.map((it) => ApiText.fromJson(it)).toList();

    return _texts;
  }

  Future<http.Response> _callApi(Uri url) async {
    http.Response response;

    try {
      response = await http.get(url);
    } catch (e) {
      logger.error('Request failed', e);
      rethrow;
    }

    return _validateApiResponse(response);
  }

  http.Response _validateApiResponse(http.Response response) {
    if (response.statusCode == HttpStatus.ok) {
      return response;
    }

    const message = 'Request failed with status';
    logger.error(message, response.statusCode);
    throw Exception('$message : ${response.statusCode}.');
  }
}
