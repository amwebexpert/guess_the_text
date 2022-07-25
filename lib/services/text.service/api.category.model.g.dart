// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.category.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiCategory _$$_ApiCategoryFromJson(Map<String, dynamic> json) =>
    _$_ApiCategory(
      id: json['id'] ?? 0,
      uuid: json['uuid'] ?? '',
      langCode: json['langcode'] ?? '',
      name: json['name'] ?? '',
      iconName: json['iconname'] ?? '',
      isCustom: json['isCustom'] ?? false,
    );

Map<String, dynamic> _$$_ApiCategoryToJson(_$_ApiCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'langcode': instance.langCode,
      'name': instance.name,
      'iconname': instance.iconName,
      'isCustom': instance.isCustom,
    };
