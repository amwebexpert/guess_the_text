class ApiAbout {
  final String name;
  final String version;
  final String description;

  ApiAbout({this.name = 'hangman', this.version = 'N/A', this.description = 'N/A'});

  factory ApiAbout.fromJson(Map<String, dynamic> json) {
    return ApiAbout(name: json['name'], description: json['description'], version: json['version']);
  }

  @override
  String toString() {
    return '{ $name, $version }';
  }
}
