import 'package:balhom/config/balhom_api_contract.dart';
import 'package:balhom/src/core/clients/api_client.dart';
import 'package:balhom/src/core/domain/entities/pagination_entity.dart';
import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/domain/failures/http/http_request_failure.dart';
import 'package:balhom/src/features/statistics/domain/entities/monthly_saving_entity.dart';
import 'package:fpdart/fpdart.dart';

class MonthlySavingsRemoteDataSource {
  final ApiClient apiClient;

  MonthlySavingsRemoteDataSource({required this.apiClient});

  Future<Either<Failure, MonthlySavingEntity>> get(int id) async {
    final response = await apiClient
        .getRequest('${BalhomAPIContract.monthlyBalance}/${id.toString()}');
    // Check if there is a request failure
    return response.fold((failure) => left(failure),
        (value) => right(MonthlySavingEntity.fromJson(value.data)));
  }

  Future<Either<Failure, List<MonthlySavingEntity>>> list({int? year}) async {
    Map<String, dynamic> queryParameters = {"page": 1};
    if (year != null) {
      queryParameters["year"] = year.toString();
    }
    final response = await apiClient.getRequest(
        BalhomAPIContract.monthlyBalance,
        queryParameters: queryParameters);
    // Check if there is a request failure
    return await response.fold((failure) => left(failure), (value) async {
      PaginationEntity page = PaginationEntity.fromJson(value.data);
      List<MonthlySavingEntity> monthlyBalances =
          page.results.map((e) => MonthlySavingEntity.fromJson(e)).toList();
      while (page.next != null) {
        queryParameters["page"]++;
        final response = await apiClient.getRequest(
            BalhomAPIContract.monthlyBalance,
            queryParameters: queryParameters);
        // Check if there is a request failure
        response.fold((_) => null, (value) {
          page = PaginationEntity.fromJson(value.data);
          monthlyBalances +=
              page.results.map((e) => MonthlySavingEntity.fromJson(e)).toList();
        });
        if (response.isLeft()) {
          return left(
              response.getLeft().getOrElse(() => HttpRequestFailure.empty()));
        }
      }
      return right(monthlyBalances);
    });
  }
}
