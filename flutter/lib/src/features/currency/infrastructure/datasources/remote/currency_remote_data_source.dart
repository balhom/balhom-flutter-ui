import 'package:balance_home_app/config/api_contract.dart';
import 'package:balance_home_app/src/core/clients/api_client/api_client.dart';
import 'package:balance_home_app/src/core/domain/entities/pagination_entity.dart';
import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/http_request_failure.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/currency_conversion_list_entity.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/currency_type_entity.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/date_currency_conversion_list_entity.dart';
import 'package:fpdart/fpdart.dart';

class CurrencyRemoteDataSource {
  final ApiClient apiClient;

  CurrencyRemoteDataSource({required this.apiClient});

  Future<Either<Failure, List<CurrencyTypeEntity>>> getTypes() async {
    Map<String, dynamic> queryParameters = {"page": 1};
    final response = await apiClient.getRequest(APIContract.currencyType,
        queryParameters: queryParameters);
    // Check if there is a request failure
    return await response.fold((failure) => left(failure), (value) async {
      PaginationEntity page = PaginationEntity.fromJson(value.data);
      List<CurrencyTypeEntity> currencyTypes =
          page.results.map((e) => CurrencyTypeEntity.fromJson(e)).toList();
      while (page.next != null) {
        queryParameters["page"]++;
        final response = await apiClient.getRequest(APIContract.currencyType,
            queryParameters: queryParameters);
        // Check if there is a request failure
        response.fold((_) => null, (value) {
          page = PaginationEntity.fromJson(value.data);
          currencyTypes +=
              page.results.map((e) => CurrencyTypeEntity.fromJson(e)).toList();
        });
        if (response.isLeft()) {
          return left(
              response.getLeft().getOrElse(() => HttpRequestFailure.empty()));
        }
      }
      return right(currencyTypes);
    });
  }

  Future<Either<Failure, CurrencyConversionListEntity>> getConversions(
      String code) async {
    final response =
        await apiClient.getRequest('${APIContract.currencyConversion}/$code');
    // Check if there is a request failure
    return response.fold((failure) => left(failure),
        (value) => right(CurrencyConversionListEntity.fromJson(value.data)));
  }

  Future<Either<Failure, DateCurrencyConversionListEntity>>
      getLastDateConversions({required int days}) async {
    final response = await apiClient
        .getRequest('${APIContract.currencyConversion}/days=$days');
    // Check if there is a request failure
    return response.fold(
        (failure) => left(failure),
        (value) =>
            right(DateCurrencyConversionListEntity.fromJson(value.data)));
  }
}
