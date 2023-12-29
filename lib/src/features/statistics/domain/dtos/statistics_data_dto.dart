import 'package:balhom/src/features/statistics/domain/entities/daily_statistics_entity.dart';
import 'package:balhom/src/features/statistics/domain/entities/monthly_statistics_entity.dart';

class StatisticsDataDto {
  final List<DailyStatisticsEntity> dailyStatistics;
  final List<MonthlyStatisticsEntity> monthlyStatistics;

  StatisticsDataDto({
    required this.dailyStatistics,
    required this.monthlyStatistics,
  });
}
