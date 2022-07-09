// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.category.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiCategory _$$_ApiCategoryFromJson(Map<String, dynamic> json) =>
    _$_ApiCategory(
      id: json['id'] ?? 0,
      uuid: json['uuid'] ?? '',
      langCode: json['langCode'] ?? '',
      name: json['name'] ?? '',
      iconName: json['iconName'] ?? '',
      isCustom: json['isCustom'] ?? false,
    );

Map<String, dynamic> _$$_ApiCategoryToJson(_$_ApiCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'langCode': instance.langCode,
      'name': instance.name,
      'iconName': instance.iconName,
      'isCustom': instance.isCustom,
    };
