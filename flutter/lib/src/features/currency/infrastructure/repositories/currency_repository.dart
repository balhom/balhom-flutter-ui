import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/http_connection_failure.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/currency_conversion_list_entity.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/currency_type_entity.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/date_currency_conversion_list_entity.dart';
import 'package:balance_home_app/src/features/currency/domain/repositories/currency_repository_interface.dart';
import 'package:balance_home_app/src/features/currency/infrastructure/datasources/local/currency_local_data_source.dart';
import 'package:balance_home_app/src/features/currency/infrastructure/datasources/remote/currency_remote_data_source.dart';
import 'package:fpdart/fpdart.dart';

class CurrencyRepository implements CurrencyRepositoryInterface {
  final CurrencyRemoteDataSource currencyRemoteDataSource;
  final CurrencyLocalDataSource currencyLocalDataSource;

  CurrencyRepository(
      {required this.currencyRemoteDataSource,
      required this.currencyLocalDataSource});

  /// Get a list of [CurrencyTypeEntity].
  @override
  Future<Either<Failure, List<CurrencyTypeEntity>>> getCurrencyTypes() async {
    final response = await currencyRemoteDataSource.getTypes();
    return await response.fold((failure) async {
      if (failure is HttpConnectionFailure) {
        return await currencyLocalDataSource.listTypes();
      }
      return left(failure);
    }, (currencyTypes) async {
      // Delete stored currency types data
      await currencyLocalDataSource.deleteAllTypes();
      // Store currency types data
      await currencyLocalDataSource.putTypes(currencyTypes);
      return right(currencyTypes);
    });
  }

  /// Get [CurrencyConversionListEntity] by `code`.
  @override
  Future<Either<Failure, CurrencyConversionListEntity>> getCurrencyConversion(
      String code) async {
    return await currencyRemoteDataSource.getConversions(code);
  }

  /// Get [DateCurrencyConversionListEntity] by `days`.
  @override
  Future<Either<Failure, DateCurrencyConversionListEntity>>
      getLastDateCurrencyConversions({required int days}) async {
    return await currencyRemoteDataSource.getLastDateConversions(days: days);
  }
}
