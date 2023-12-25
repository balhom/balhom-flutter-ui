// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_conversion_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyConversionListEntityImpl _$$CurrencyConversionListEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrencyConversionListEntityImpl(
      code: json['code'] as String,
      conversions: (json['conversions'] as List<dynamic>)
          .map((e) =>
              CurrencyConversionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CurrencyConversionListEntityImplToJson(
        _$CurrencyConversionListEntityImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'conversions': instance.conversions,
    };
