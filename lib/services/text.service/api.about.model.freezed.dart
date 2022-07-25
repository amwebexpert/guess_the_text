// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api.about.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiAbout _$ApiAboutFromJson(Map<String, dynamic> json) {
  return _ApiAbout.fromJson(json);
}

/// @nodoc
mixin _$ApiAbout {
  String get name => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiAboutCopyWith<ApiAbout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiAboutCopyWith<$Res> {
  factory $ApiAboutCopyWith(ApiAbout value, $Res Function(ApiAbout) then) =
      _$ApiAboutCopyWithImpl<$Res>;
  $Res call({String name, String version, String description});
}

/// @nodoc
class _$ApiAboutCopyWithImpl<$Res> implements $ApiAboutCopyWith<$Res> {
  _$ApiAboutCopyWithImpl(this._value, this._then);

  final ApiAbout _value;
  // ignore: unused_field
  final $Res Function(ApiAbout) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? version = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ApiAboutCopyWith<$Res> implements $ApiAboutCopyWith<$Res> {
  factory _$$_ApiAboutCopyWith(
          _$_ApiAbout value, $Res Function(_$_ApiAbout) then) =
      __$$_ApiAboutCopyWithImpl<$Res>;
  @override
  $Res call({String name, String version, String description});
}

/// @nodoc
class __$$_ApiAboutCopyWithImpl<$Res> extends _$ApiAboutCopyWithImpl<$Res>
    implements _$$_ApiAboutCopyWith<$Res> {
  __$$_ApiAboutCopyWithImpl(
      _$_ApiAbout _value, $Res Function(_$_ApiAbout) _then)
      : super(_value, (v) => _then(v as _$_ApiAbout));

  @override
  _$_ApiAbout get _value => super._value as _$_ApiAbout;

  @override
  $Res call({
    Object? name = freezed,
    Object? version = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_ApiAbout(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiAbout implements _ApiAbout {
  const _$_ApiAbout(
      {this.name = 'hangman', this.version = 'N/A', this.description = 'N/A'});

  factory _$_ApiAbout.fromJson(Map<String, dynamic> json) =>
      _$$_ApiAboutFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String version;
  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'ApiAbout(name: $name, version: $version, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiAbout &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_ApiAboutCopyWith<_$_ApiAbout> get copyWith =>
      __$$_ApiAboutCopyWithImpl<_$_ApiAbout>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiAboutToJson(this);
  }
}

abstract class _ApiAbout implements ApiAbout {
  const factory _ApiAbout(
      {final String name,
      final String version,
      final String description}) = _$_ApiAbout;

  factory _ApiAbout.fromJson(Map<String, dynamic> json) = _$_ApiAbout.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get version => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ApiAboutCopyWith<_$_ApiAbout> get copyWith =>
      throw _privateConstructorUsedError;
}
