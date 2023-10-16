import 'package:balance_home_app/config/currency_conversion_api_contract.dart';
import 'package:balance_home_app/src/core/clients/api_client/api_client.dart';
import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/currency_conversion_list_entity.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/currency_type_entity.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/date_currency_conversion_list_entity.dart';
import 'package:fpdart/fpdart.dart';

class CurrencyRemoteDataSource {
  final ApiClient apiClient;

  CurrencyRemoteDataSource({required this.apiClient});

  Future<Either<Failure, List<CurrencyTypeEntity>>> getTypes() async {
    final response =
        await apiClient.getRequest(CurrencyConversionAPIContract.currencyTypes);
    // Check if there is a request failure
    return await response.fold((failure) => left(failure), (value) async {
      final List<dynamic> responseList = value.data as List;
      final List<CurrencyTypeEntity> currencyTypes = responseList
          .map((data) => CurrencyTypeEntity.fromJson(data))
          .toList();
      return right(currencyTypes);
    });
  }

  Future<Either<Failure, CurrencyConversionListEntity>> getConversions(
      final String currencyCode) async {
    final response = await apiClient.getRequest(
        '${CurrencyConversionAPIContract.currencyConversion}/$currencyCode');
    // Check if there is a request failure
    return response.fold((failure) => left(failure),
        (value) => right(CurrencyConversionListEntity.fromJson(value.data)));
  }

  Future<Either<Failure, DateCurrencyConversionListEntity>> getDaysConversions(
      {required int days}) async {
    final response = await apiClient.getRequest(
        '${CurrencyConversionAPIContract.currencyConversionDays}/$days');
    // Check if there is a request failure
    return response.fold(
        (failure) => left(failure),
        (value) =>
            right(DateCurrencyConversionListEntity.fromJson(value.data)));
  }
}
