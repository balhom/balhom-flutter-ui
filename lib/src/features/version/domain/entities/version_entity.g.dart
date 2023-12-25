// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VersionEntityImpl _$$VersionEntityImplFromJson(Map<String, dynamic> json) =>
    _$VersionEntityImpl(
      appVersion: json['app_version'] as String,
      webVersion: json['web_version'] as String,
      apiVersion: json['api_version'] as String,
    );

Map<String, dynamic> _$$VersionEntityImplToJson(_$VersionEntityImpl instance) =>
    <String, dynamic>{
      'app_version': instance.appVersion,
      'web_version': instance.webVersion,
      'api_version': instance.apiVersion,
    };
