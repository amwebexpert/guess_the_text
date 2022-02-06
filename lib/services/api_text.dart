class ApiText {
  final int id;
  final String uuid;
  final String original;
  final String normalized;

  ApiText(this.id, this.uuid, this.original, this.normalized);

  factory ApiText.fromJson(Map<String, dynamic> json) {
    return ApiText(json['id'] as int, json['uuid'] as String,
        json['original'] as String, json['normalized'] as String);
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.original} }';
  }
}
