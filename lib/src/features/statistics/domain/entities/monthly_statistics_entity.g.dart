// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_statistics_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonthlyStatisticsEntityImpl _$$MonthlyStatisticsEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$MonthlyStatisticsEntityImpl(
      month: json['month'] as int,
      expense: (json['expense'] as num).toDouble(),
      revenue: (json['revenue'] as num).toDouble(),
    );

Map<String, dynamic> _$$MonthlyStatisticsEntityImplToJson(
        _$MonthlyStatisticsEntityImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'expense': instance.expense,
      'revenue': instance.revenue,
    };
