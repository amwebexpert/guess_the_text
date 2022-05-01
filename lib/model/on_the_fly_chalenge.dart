import 'dart:convert' as convert;

class OnTheFlyChalenge {
  final String text;
  late String data;

  OnTheFlyChalenge({this.text = ''}) {
    data = convert.base64.encode(convert.utf8.encode(text));
  }

  String toJsonString() => convert.json.encode({
        'data': data,
        'instructions-fr':
            "Vous devez installer et utiliser l'application pour lire le code QR et le récupérer de votre adversaire !",
        'instructions-en':
            'You must install and use the app menu to read the QR code and retrieve challenge from your opponent!',
      });

  static OnTheFlyChalenge fromJsonString(String jsonString) {
    final Map<String, dynamic> jsonMap = convert.jsonDecode(jsonString);

    if (!jsonMap.containsKey('data') || jsonMap['data'] == null) {
      return OnTheFlyChalenge();
    }

    final base64data = jsonMap['data']!;
    final decodedText = convert.utf8.decode(convert.base64.decode(base64data));
    return OnTheFlyChalenge(text: decodedText);
  }
}
