import 'package:freezed_annotation/freezed_annotation.dart';

part 'api.category.model.freezed.dart';
part 'api.category.model.g.dart';

@Freezed()
class ApiCategory with _$ApiCategory {
  const factory ApiCategory(
      {@Default(0) id,
      @Default('') uuid,
      @JsonKey(name: 'langcode', defaultValue: '') langCode,
      @Default('') name,
      @JsonKey(name: 'iconname', defaultValue: '') iconName,
      @Default(false) isCustom}) = _ApiCategory;

  factory ApiCategory.fromJson(Map<String, dynamic> json) => _$ApiCategoryFromJson(json);
}
