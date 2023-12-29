// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_summary_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BalanceSummaryEntityImpl _$$BalanceSummaryEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$BalanceSummaryEntityImpl(
      type: json['type'] as String,
      quantity: (json['quantity'] as num).toDouble(),
    );

Map<String, dynamic> _$$BalanceSummaryEntityImplToJson(
        _$BalanceSummaryEntityImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'quantity': instance.quantity,
    };
