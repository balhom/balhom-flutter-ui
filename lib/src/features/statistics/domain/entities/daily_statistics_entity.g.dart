// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_statistics_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyStatisticsEntityImpl _$$DailyStatisticsEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyStatisticsEntityImpl(
      day: json['day'] as int,
      expense: (json['expense'] as num).toDouble(),
      revenue: (json['revenue'] as num).toDouble(),
    );

Map<String, dynamic> _$$DailyStatisticsEntityImplToJson(
        _$DailyStatisticsEntityImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'expense': instance.expense,
      'revenue': instance.revenue,
    };
