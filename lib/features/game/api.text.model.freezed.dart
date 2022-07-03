// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api.text.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiText _$ApiTextFromJson(Map<String, dynamic> json) {
  return _ApiText.fromJson(json);
}

/// @nodoc
mixin _$ApiText {
  dynamic get id => throw _privateConstructorUsedError;
  dynamic get uuid => throw _privateConstructorUsedError;
  dynamic get original => throw _privateConstructorUsedError;
  dynamic get normalized => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiTextCopyWith<ApiText> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiTextCopyWith<$Res> {
  factory $ApiTextCopyWith(ApiText value, $Res Function(ApiText) then) =
      _$ApiTextCopyWithImpl<$Res>;
  $Res call({dynamic id, dynamic uuid, dynamic original, dynamic normalized});
}

/// @nodoc
class _$ApiTextCopyWithImpl<$Res> implements $ApiTextCopyWith<$Res> {
  _$ApiTextCopyWithImpl(this._value, this._then);

  final ApiText _value;
  // ignore: unused_field
  final $Res Function(ApiText) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? original = freezed,
    Object? normalized = freezed,
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
      original: original == freezed
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as dynamic,
      normalized: normalized == freezed
          ? _value.normalized
          : normalized // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_ApiTextCopyWith<$Res> implements $ApiTextCopyWith<$Res> {
  factory _$$_ApiTextCopyWith(
          _$_ApiText value, $Res Function(_$_ApiText) then) =
      __$$_ApiTextCopyWithImpl<$Res>;
  @override
  $Res call({dynamic id, dynamic uuid, dynamic original, dynamic normalized});
}

/// @nodoc
class __$$_ApiTextCopyWithImpl<$Res> extends _$ApiTextCopyWithImpl<$Res>
    implements _$$_ApiTextCopyWith<$Res> {
  __$$_ApiTextCopyWithImpl(_$_ApiText _value, $Res Function(_$_ApiText) _then)
      : super(_value, (v) => _then(v as _$_ApiText));

  @override
  _$_ApiText get _value => super._value as _$_ApiText;

  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? original = freezed,
    Object? normalized = freezed,
  }) {
    return _then(_$_ApiText(
      id: id == freezed ? _value.id : id,
      uuid: uuid == freezed ? _value.uuid : uuid,
      original: original == freezed ? _value.original : original,
      normalized: normalized == freezed ? _value.normalized : normalized,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiText implements _ApiText {
  const _$_ApiText(
      {this.id = 0, this.uuid = '', this.original = '', this.normalized = ''});

  factory _$_ApiText.fromJson(Map<String, dynamic> json) =>
      _$$_ApiTextFromJson(json);

  @override
  @JsonKey()
  final dynamic id;
  @override
  @JsonKey()
  final dynamic uuid;
  @override
  @JsonKey()
  final dynamic original;
  @override
  @JsonKey()
  final dynamic normalized;

  @override
  String toString() {
    return 'ApiText(id: $id, uuid: $uuid, original: $original, normalized: $normalized)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiText &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality().equals(other.original, original) &&
            const DeepCollectionEquality()
                .equals(other.normalized, normalized));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(original),
      const DeepCollectionEquality().hash(normalized));

  @JsonKey(ignore: true)
  @override
  _$$_ApiTextCopyWith<_$_ApiText> get copyWith =>
      __$$_ApiTextCopyWithImpl<_$_ApiText>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiTextToJson(this);
  }
}

abstract class _ApiText implements ApiText {
  const factory _ApiText(
      {final dynamic id,
      final dynamic uuid,
      final dynamic original,
      final dynamic normalized}) = _$_ApiText;

  factory _ApiText.fromJson(Map<String, dynamic> json) = _$_ApiText.fromJson;

  @override
  dynamic get id => throw _privateConstructorUsedError;
  @override
  dynamic get uuid => throw _privateConstructorUsedError;
  @override
  dynamic get original => throw _privateConstructorUsedError;
  @override
  dynamic get normalized => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ApiTextCopyWith<_$_ApiText> get copyWith =>
      throw _privateConstructorUsedError;
}
