import 'package:balhom/config/balhom_api_contract.dart';
import 'package:balhom/src/core/clients/api_client.dart';
import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/statistics/domain/entities/monthly_statistics_entity.dart';
import 'package:fpdart/fpdart.dart';

class MonthlyStatisticsRemoteDataSource {
  final ApiClient apiClient;

  MonthlyStatisticsRemoteDataSource({required this.apiClient});

  Future<Either<Failure, List<MonthlyStatisticsEntity>>> list(
      final int year) async {
    final response =
        await apiClient.getRequest("${BalhomAPIContract.statistics}/$year");
    // Check if there is a request failure
    return await response.fold((failure) => left(failure), (response) async {
      final List<dynamic> responseList = response.data as List;
      final List<MonthlyStatisticsEntity> statisticsList = [];
      for (final statistic in responseList) {
        statisticsList.add(MonthlyStatisticsEntity.fromJson(statistic));
      }
      return right(statisticsList);
    });
  }
}
