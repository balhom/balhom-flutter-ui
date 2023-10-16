import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/currency_conversion_entity.dart';
import 'package:balance_home_app/src/features/currency/domain/repositories/currency_repository_interface.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrencyConversionController {
  final CurrencyRepositoryInterface currencyRepository;

  CurrencyConversionController({required this.currencyRepository});

  Future<Either<Failure, double>> getCurrencyConversion(
      final double quantity,
      final String currencyFrom,
      final String currencyTo,
      final AppLocalizations appLocalizations) async {
    return (await currencyRepository.getCurrencyConversion(currencyFrom)).fold(
        (failure) => left(
            UnprocessableValueFailure(detail: appLocalizations.genericError)),
        (currencyConversionListEntity) {
      for (final CurrencyConversionEntity currencyConversionEntity
          in currencyConversionListEntity.conversions) {
        if (currencyConversionEntity.code == currencyTo) {
          return right(((quantity * currencyConversionEntity.value) * 100)
                  .roundToDouble() /
              100.0);
        }
      }
      return left(
          UnprocessableValueFailure(detail: appLocalizations.genericError));
    });
  }
}
