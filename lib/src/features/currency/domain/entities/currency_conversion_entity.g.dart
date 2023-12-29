// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_conversion_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyConversionEntityImpl _$$CurrencyConversionEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrencyConversionEntityImpl(
      code: json['code'] as String,
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$$CurrencyConversionEntityImplToJson(
        _$CurrencyConversionEntityImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'value': instance.value,
    };
