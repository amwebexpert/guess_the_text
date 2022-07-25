import 'package:freezed_annotation/freezed_annotation.dart';

part 'api.about.model.freezed.dart';
part 'api.about.model.g.dart';

@Freezed()
class ApiAbout with _$ApiAbout {
  const factory ApiAbout(
      {@Default('hangman') String name,
      @Default('N/A') String version,
      @Default('N/A') String description}) = _ApiAbout;

  factory ApiAbout.fromJson(Map<String, dynamic> json) => _$ApiAboutFromJson(json);
}
