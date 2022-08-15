import 'dart:convert' as convert;

class OnTheFlyChallenge {
  final String text;
  late final String data;

  OnTheFlyChallenge({this.text = ''}) {
    data = convert.base64.encode(convert.utf8.encode(text));
  }

  String toJson(String localizedInstructions) => convert.json.encode({
        'data': data,
        'instructions': localizedInstructions,
      });

  static OnTheFlyChallenge fromJson(String jsonString) {
    final Map<String, dynamic> jsonMap = convert.jsonDecode(jsonString);

    if (!jsonMap.containsKey('data') || jsonMap['data'] == null) {
      return OnTheFlyChallenge();
    }

    final String base64data = jsonMap['data']!;
    final String decodedText = convert.utf8.decode(convert.base64.decode(base64data));

    return OnTheFlyChallenge(text: decodedText);
  }
}
