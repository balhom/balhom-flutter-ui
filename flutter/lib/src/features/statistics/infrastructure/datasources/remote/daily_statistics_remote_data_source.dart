import 'package:balance_home_app/config/balhom_api_contract.dart';
import 'package:balance_home_app/src/core/clients/api_client/api_client.dart';
import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/statistics/domain/entities/daily_statistics_entity.dart';
import 'package:fpdart/fpdart.dart';

class DailyStatisticsRemoteDataSource {
  final ApiClient apiClient;

  DailyStatisticsRemoteDataSource({required this.apiClient});

  Future<Either<Failure, List<DailyStatisticsEntity>>> list(
      final int year, final int month) async {
    final response = await apiClient
        .getRequest("${BalhomAPIContract.statistics}/$year/$month");
    // Check if there is a request failure
    return await response.fold((failure) => left(failure), (response) async {
      final List<dynamic> responseList = response.data as List;
      final List<DailyStatisticsEntity> statisticsList = [];
      for (final statistic in responseList) {
        statisticsList.add(DailyStatisticsEntity.fromJson(statistic));
      }
      return right(statisticsList);
    });
  }
}
