// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.about.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiAbout _$$_ApiAboutFromJson(Map<String, dynamic> json) => _$_ApiAbout(
      name: json['name'] as String? ?? 'hangman',
      version: json['version'] as String? ?? 'N/A',
      description: json['description'] as String? ?? 'N/A',
    );

Map<String, dynamic> _$$_ApiAboutToJson(_$_ApiAbout instance) =>
    <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
      'description': instance.description,
    };
