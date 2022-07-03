import 'package:freezed_annotation/freezed_annotation.dart';

part 'api.category.model.freezed.dart';
part 'api.category.model.g.dart';

@Freezed()
class ApiCategory with _$ApiCategory {
  const factory ApiCategory(
      {@Default(0) id,
      @Default('') uuid,
      @Default('') langCode,
      @Default('') name,
      @Default('') iconName,
      @Default(false) isCustom}) = _ApiCategory;

  factory ApiCategory.fromJson(Map<String, dynamic> json) => _$ApiCategoryFromJson(json);
}
