import 'package:balance_home_app/src/features/statistics/domain/entities/daily_statistics_entity.dart';
import 'package:balance_home_app/src/features/statistics/domain/entities/monthly_statistics_entity.dart';

class StatisticsDataDto {
  List<DailyStatisticsEntity> dailyStatistics;
  List<MonthlyStatisticsEntity> monthlyStatistics;

  StatisticsDataDto({
    required this.dailyStatistics,
    required this.monthlyStatistics,
  });
}
