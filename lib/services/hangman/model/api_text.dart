class ApiText {
  final int id;
  final String uuid;
  final String original;
  final String normalized;

  ApiText({this.id = 0, this.uuid = '', this.original = '', this.normalized = ''});

  factory ApiText.fromJson(Map<String, dynamic> json) => ApiText(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      original: json['original'] as String,
      normalized: json['normalized'] as String);

  @override
  String toString() {
    return '{ $id, $original }';
  }
}
