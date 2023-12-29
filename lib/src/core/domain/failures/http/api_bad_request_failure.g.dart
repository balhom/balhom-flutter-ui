// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_bad_request_failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiBadRequestFailure _$ApiBadRequestFailureFromJson(
        Map<String, dynamic> json) =>
    ApiBadRequestFailure(
      detail: json['detail'] as String,
      errorCode: json['error_code'] as int? ?? -1,
    );

Map<String, dynamic> _$ApiBadRequestFailureToJson(
        ApiBadRequestFailure instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'error_code': instance.errorCode,
    };
