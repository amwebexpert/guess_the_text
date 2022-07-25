// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api.category.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiCategory _$ApiCategoryFromJson(Map<String, dynamic> json) {
  return _ApiCategory.fromJson(json);
}

/// @nodoc
mixin _$ApiCategory {
  dynamic get id => throw _privateConstructorUsedError;
  dynamic get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'langcode', defaultValue: '')
  dynamic get langCode => throw _privateConstructorUsedError;
  dynamic get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'iconname', defaultValue: '')
  dynamic get iconName => throw _privateConstructorUsedError;
  dynamic get isCustom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiCategoryCopyWith<ApiCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiCategoryCopyWith<$Res> {
  factory $ApiCategoryCopyWith(
          ApiCategory value, $Res Function(ApiCategory) then) =
      _$ApiCategoryCopyWithImpl<$Res>;
  $Res call(
      {dynamic id,
      dynamic uuid,
      @JsonKey(name: 'langcode', defaultValue: '') dynamic langCode,
      dynamic name,
      @JsonKey(name: 'iconname', defaultValue: '') dynamic iconName,
      dynamic isCustom});
}

/// @nodoc
class _$ApiCategoryCopyWithImpl<$Res> implements $ApiCategoryCopyWith<$Res> {
  _$ApiCategoryCopyWithImpl(this._value, this._then);

  final ApiCategory _value;
  // ignore: unused_field
  final $Res Function(ApiCategory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? langCode = freezed,
    Object? name = freezed,
    Object? iconName = freezed,
    Object? isCustom = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as dynamic,
      langCode: langCode == freezed
          ? _value.langCode
          : langCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      iconName: iconName == freezed
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isCustom: isCustom == freezed
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_ApiCategoryCopyWith<$Res>
    implements $ApiCategoryCopyWith<$Res> {
  factory _$$_ApiCategoryCopyWith(
          _$_ApiCategory value, $Res Function(_$_ApiCategory) then) =
      __$$_ApiCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic id,
      dynamic uuid,
      @JsonKey(name: 'langcode', defaultValue: '') dynamic langCode,
      dynamic name,
      @JsonKey(name: 'iconname', defaultValue: '') dynamic iconName,
      dynamic isCustom});
}

/// @nodoc
class __$$_ApiCategoryCopyWithImpl<$Res> extends _$ApiCategoryCopyWithImpl<$Res>
    implements _$$_ApiCategoryCopyWith<$Res> {
  __$$_ApiCategoryCopyWithImpl(
      _$_ApiCategory _value, $Res Function(_$_ApiCategory) _then)
      : super(_value, (v) => _then(v as _$_ApiCategory));

  @override
  _$_ApiCategory get _value => super._value as _$_ApiCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? langCode = freezed,
    Object? name = freezed,
    Object? iconName = freezed,
    Object? isCustom = freezed,
  }) {
    return _then(_$_ApiCategory(
      id: id == freezed ? _value.id : id,
      uuid: uuid == freezed ? _value.uuid : uuid,
      langCode: langCode == freezed ? _value.langCode : langCode,
      name: name == freezed ? _value.name : name,
      iconName: iconName == freezed ? _value.iconName : iconName,
      isCustom: isCustom == freezed ? _value.isCustom : isCustom,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiCategory implements _ApiCategory {
  const _$_ApiCategory(
      {this.id = 0,
      this.uuid = '',
      @JsonKey(name: 'langcode', defaultValue: '') this.langCode,
      this.name = '',
      @JsonKey(name: 'iconname', defaultValue: '') this.iconName,
      this.isCustom = false});

  factory _$_ApiCategory.fromJson(Map<String, dynamic> json) =>
      _$$_ApiCategoryFromJson(json);

  @override
  @JsonKey()
  final dynamic id;
  @override
  @JsonKey()
  final dynamic uuid;
  @override
  @JsonKey(name: 'langcode', defaultValue: '')
  final dynamic langCode;
  @override
  @JsonKey()
  final dynamic name;
  @override
  @JsonKey(name: 'iconname', defaultValue: '')
  final dynamic iconName;
  @override
  @JsonKey()
  final dynamic isCustom;

  @override
  String toString() {
    return 'ApiCategory(id: $id, uuid: $uuid, langCode: $langCode, name: $name, iconName: $iconName, isCustom: $isCustom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiCategory &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality().equals(other.langCode, langCode) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.iconName, iconName) &&
            const DeepCollectionEquality().equals(other.isCustom, isCustom));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(langCode),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(iconName),
      const DeepCollectionEquality().hash(isCustom));

  @JsonKey(ignore: true)
  @override
  _$$_ApiCategoryCopyWith<_$_ApiCategory> get copyWith =>
      __$$_ApiCategoryCopyWithImpl<_$_ApiCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiCategoryToJson(this);
  }
}

abstract class _ApiCategory implements ApiCategory {
  const factory _ApiCategory(
      {final dynamic id,
      final dynamic uuid,
      @JsonKey(name: 'langcode', defaultValue: '') final dynamic langCode,
      final dynamic name,
      @JsonKey(name: 'iconname', defaultValue: '') final dynamic iconName,
      final dynamic isCustom}) = _$_ApiCategory;

  factory _ApiCategory.fromJson(Map<String, dynamic> json) =
      _$_ApiCategory.fromJson;

  @override
  dynamic get id => throw _privateConstructorUsedError;
  @override
  dynamic get uuid => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'langcode', defaultValue: '')
  dynamic get langCode => throw _privateConstructorUsedError;
  @override
  dynamic get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'iconname', defaultValue: '')
  dynamic get iconName => throw _privateConstructorUsedError;
  @override
  dynamic get isCustom => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ApiCategoryCopyWith<_$_ApiCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
