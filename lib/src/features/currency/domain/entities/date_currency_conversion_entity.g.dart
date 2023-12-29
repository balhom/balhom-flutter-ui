// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_currency_conversion_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DateCurrencyConversionEntityImpl _$$DateCurrencyConversionEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DateCurrencyConversionEntityImpl(
      conversions: (json['conversions'] as List<dynamic>)
          .map((e) =>
              CurrencyConversionListEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$DateCurrencyConversionEntityImplToJson(
        _$DateCurrencyConversionEntityImpl instance) =>
    <String, dynamic>{
      'conversions': instance.conversions,
      'date': instance.date.toIso8601String(),
    };
