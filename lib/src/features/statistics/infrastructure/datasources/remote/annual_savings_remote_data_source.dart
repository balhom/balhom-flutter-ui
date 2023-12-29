import 'package:balhom/config/balhom_api_contract.dart';
import 'package:balhom/src/core/clients/api_client.dart';
import 'package:balhom/src/core/domain/entities/pagination_entity.dart';
import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/domain/failures/http/http_request_failure.dart';
import 'package:balhom/src/features/statistics/domain/entities/annual_saving_entity.dart';
import 'package:fpdart/fpdart.dart';

class AnnualSavingsRemoteDataSource {
  final ApiClient apiClient;

  AnnualSavingsRemoteDataSource({required this.apiClient});

  Future<Either<Failure, AnnualSavingEntity>> get(int id) async {
    final response = await apiClient
        .getRequest('${BalhomAPIContract.annualBalance}/${id.toString()}');
    // Check if there is a request failure
    return response.fold((failure) => left(failure),
        (value) => right(AnnualSavingEntity.fromJson(value.data)));
  }

  Future<Either<Failure, List<AnnualSavingEntity>>> list() async {
    Map<String, dynamic> queryParameters = {"page": 1};
    final response = await apiClient.getRequest(BalhomAPIContract.annualBalance,
        queryParameters: queryParameters);
    // Check if there is a request failure
    return await response.fold((failure) => left(failure), (value) async {
      PaginationEntity page = PaginationEntity.fromJson(value.data);
      List<AnnualSavingEntity> annualBalances =
          page.results.map((e) => AnnualSavingEntity.fromJson(e)).toList();
      // No more than 10 annual balances data would be needed
      while (page.next != null && annualBalances.length < 10) {
        queryParameters["page"]++;
        final response = await apiClient.getRequest(
            BalhomAPIContract.annualBalance,
            queryParameters: queryParameters);
        // Check if there is a request failure
        response.fold((_) => null, (value) {
          page = PaginationEntity.fromJson(value.data);
          annualBalances +=
              page.results.map((e) => AnnualSavingEntity.fromJson(e)).toList();
        });
        if (response.isLeft()) {
          return left(
              response.getLeft().getOrElse(() => HttpRequestFailure.empty()));
        }
      }
      return right(annualBalances);
    });
  }
}
