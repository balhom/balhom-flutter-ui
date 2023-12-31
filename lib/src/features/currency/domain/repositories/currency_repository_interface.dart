import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/currency/domain/entities/currency_conversion_list_entity.dart';
import 'package:balhom/src/features/currency/domain/entities/currency_type_entity.dart';
import 'package:balhom/src/features/currency/domain/entities/date_currency_conversion_list_entity.dart';
import 'package:fpdart/fpdart.dart';

/// Currency Repository Interface.
abstract class CurrencyRepositoryInterface {
  /// Get a list of [CurrencyTypeEntity].
  Future<Either<Failure, List<CurrencyTypeEntity>>> getCurrencyTypes();

  /// Get [CurrencyConversionListEntity] by `code`.
  Future<Either<Failure, CurrencyConversionListEntity>> getCurrencyConversion(
      String code);

  /// Get [DateCurrencyConversionListEntity] by `days`.
  Future<Either<Failure, DateCurrencyConversionListEntity>>
      getDaysCurrencyConversions({required int days});
}
