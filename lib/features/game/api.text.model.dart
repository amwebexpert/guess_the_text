import 'package:freezed_annotation/freezed_annotation.dart';

part 'api.text.model.freezed.dart';
part 'api.text.model.g.dart';

@Freezed()
class ApiText with _$ApiText {
  const factory ApiText({@Default(0) id, @Default('') uuid, @Default('') original, @Default('') normalized}) = _ApiText;

  factory ApiText.fromJson(Map<String, dynamic> json) => _$ApiTextFromJson(json);
}
