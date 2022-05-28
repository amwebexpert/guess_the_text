class ApiCategory {
  final int id;
  final String uuid;
  final String langCode;
  final String name;
  final bool isCustom;

  ApiCategory({this.id = 0, this.uuid = '', this.langCode = '', this.name = '', this.isCustom = false});

  bool get isEmpty => id == 0;

  factory ApiCategory.fromJson(Map<String, dynamic> json) => ApiCategory(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      langCode: json['langcode'] as String,
      name: json['name'] as String);

  @override
  String toString() {
    return '{ $id, $langCode , $name }';
  }
}
