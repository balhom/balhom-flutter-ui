import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balhom/src/features/currency/domain/entities/currency_conversion_entity.dart';
import 'package:balhom/src/features/currency/domain/repositories/currency_repository_interface.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrencyConversionUseCase {
  final CurrencyRepositoryInterface currencyRepository;

  CurrencyConversionUseCase({required this.currencyRepository});

  Future<Either<Failure, double>> handle(
      final double quantity,
      final String currencyFrom,
      final String currencyTo,
      final AppLocalizations appLocalizations) async {
    return (await currencyRepository.getCurrencyConversion(currencyFrom)).fold(
        (failure) =>
            left(InvalidValueFailure(detail: appLocalizations.genericError)),
        (currencyConversionListEntity) {
      for (final CurrencyConversionEntity currencyConversionEntity
          in currencyConversionListEntity.conversions) {
        if (currencyConversionEntity.code == currencyTo) {
          return right(((quantity * currencyConversionEntity.value) * 100)
                  .roundToDouble() /
              100.0);
        }
      }
      return left(InvalidValueFailure(detail: appLocalizations.genericError));
    });
  }
}
