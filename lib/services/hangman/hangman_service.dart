import 'dart:convert' as convert;
import 'dart:math';

import 'package:guess_the_text/services/hangman/model/api_category.dart';
import 'package:http/http.dart' as http;

import 'model/api_text.dart';

class HangmanService {
  static final HangmanService _instance = HangmanService._privateConstructor();

  static const String hostName = 'amw-hangman-api.herokuapp.com';
  static const String apiPathCategories = '/api/v1/categories';

  List<ApiCategory> categories = [];
  late String selectedCategoryUuid;
  List<ApiText> entries = [];

  factory HangmanService() => _instance;
  HangmanService._privateConstructor();

  Future<void> loadCategories() async {
    try {
      Uri url = Uri.https(hostName, apiPathCategories);

      // API call
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> array = convert.jsonDecode(response.body);

        categories = array.map((it) => ApiCategory.fromJson(it)).toList();
        selectedCategoryUuid = categories[0].uuid;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Request failed: ${e.toString()}');
    }
  }

  Future<void> loadData() async {
    try {
      String entriesUrl = '$apiPathCategories/$selectedCategoryUuid/texts';
      Uri url = Uri.https(hostName, entriesUrl);

      // API call
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> array = convert.jsonDecode(response.body);
        entries = array.map((it) => ApiText.fromJson(it)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Request failed: ${e.toString()}');
    }
  }

  ApiText shuffle() {
    int i = Random(DateTime.now().millisecondsSinceEpoch).nextInt(entries.length);
    return entries.elementAt(i);
  }
}
