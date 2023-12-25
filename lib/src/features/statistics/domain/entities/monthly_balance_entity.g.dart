// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_balance_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonthlyBalanceEntityImpl _$$MonthlyBalanceEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$MonthlyBalanceEntityImpl(
      grossQuantity: (json['gross_quantity'] as num).toDouble(),
      expectedQuantity: (json['expected_quantity'] as num).toDouble(),
      currencyType: json['currency_type'] as String,
      year: json['year'] as int,
      month: json['month'] as int,
      created: DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$$MonthlyBalanceEntityImplToJson(
        _$MonthlyBalanceEntityImpl instance) =>
    <String, dynamic>{
      'gross_quantity': instance.grossQuantity,
      'expected_quantity': instance.expectedQuantity,
      'currency_type': instance.currencyType,
      'year': instance.year,
      'month': instance.month,
      'created': instance.created.toIso8601String(),
    };
