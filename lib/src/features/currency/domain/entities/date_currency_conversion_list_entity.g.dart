// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_currency_conversion_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DateCurrencyConversionListEntityImpl
    _$$DateCurrencyConversionListEntityImplFromJson(
            Map<String, dynamic> json) =>
        _$DateCurrencyConversionListEntityImpl(
          dateConversions: (json['date_conversions'] as List<dynamic>)
              .map((e) => DateCurrencyConversionEntity.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$DateCurrencyConversionListEntityImplToJson(
        _$DateCurrencyConversionListEntityImpl instance) =>
    <String, dynamic>{
      'date_conversions': instance.dateConversions,
    };
