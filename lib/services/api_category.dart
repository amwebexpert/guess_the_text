class ApiCategory {
  final int id;
  final String uuid;
  final String langCode;
  final String name;

  ApiCategory(this.id, this.uuid, this.langCode, this.name);

  factory ApiCategory.fromJson(Map<String, dynamic> json) {
    return ApiCategory(json['id'] as int, json['uuid'] as String, json['langcode'] as String, json['name'] as String);
  }

  @override
  String toString() {
    return '{ $id, $langCode , $name }';
  }
}
