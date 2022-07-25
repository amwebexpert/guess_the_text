// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.text.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiText _$$_ApiTextFromJson(Map<String, dynamic> json) => _$_ApiText(
      id: json['id'] ?? 0,
      uuid: json['uuid'] ?? '',
      original: json['original'] ?? '',
      normalized: json['normalized'] ?? '',
    );

Map<String, dynamic> _$$_ApiTextToJson(_$_ApiText instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'original': instance.original,
      'normalized': instance.normalized,
    };
