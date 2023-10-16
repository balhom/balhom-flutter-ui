import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/currency_conversion_list_entity.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/currency_type_entity.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/date_currency_conversion_list_entity.dart';
import 'package:balance_home_app/src/features/currency/domain/repositories/currency_repository_interface.dart';
import 'package:balance_home_app/src/features/currency/infrastructure/datasources/remote/currency_remote_data_source.dart';
import 'package:fpdart/fpdart.dart';

class CurrencyRepository implements CurrencyRepositoryInterface {
  final CurrencyRemoteDataSource currencyRemoteDataSource;

  CurrencyRepository({required this.currencyRemoteDataSource});

  /// Get a list of [CurrencyTypeEntity].
  @override
  Future<Either<Failure, List<CurrencyTypeEntity>>> getCurrencyTypes() async {
    final response = await currencyRemoteDataSource.getTypes();
    return await response.fold((failure) async {
      return left(failure);
    }, (currencyTypes) async {
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
      getDaysCurrencyConversions({required int days}) async {
    return await currencyRemoteDataSource.getDaysConversions(days: days);
  }
}
