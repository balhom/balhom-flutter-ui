// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_bad_request_failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputBadRequestFailure _$InputBadRequestFailureFromJson(
        Map<String, dynamic> json) =>
    InputBadRequestFailure(
      detail: json['detail'] as String,
      fields: (json['fields'] as List<dynamic>)
          .map((e) => InputField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InputBadRequestFailureToJson(
        InputBadRequestFailure instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'fields': instance.fields,
    };

InputField _$InputFieldFromJson(Map<String, dynamic> json) => InputField(
      name: json['name'] as String,
      detail: json['detail'] as String,
    );

Map<String, dynamic> _$InputFieldToJson(InputField instance) =>
    <String, dynamic>{
      'name': instance.name,
      'detail': instance.detail,
    };
