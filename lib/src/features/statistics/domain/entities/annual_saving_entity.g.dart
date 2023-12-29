// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_saving_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnnualSavingEntityImpl _$$AnnualSavingEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AnnualSavingEntityImpl(
      grossQuantity: (json['gross_quantity'] as num).toDouble(),
      expectedQuantity: (json['expected_quantity'] as num).toDouble(),
      currencyType: json['currency_type'] as String,
      year: json['year'] as int,
      created: DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$$AnnualSavingEntityImplToJson(
        _$AnnualSavingEntityImpl instance) =>
    <String, dynamic>{
      'gross_quantity': instance.grossQuantity,
      'expected_quantity': instance.expectedQuantity,
      'currency_type': instance.currencyType,
      'year': instance.year,
      'created': instance.created.toIso8601String(),
    };
