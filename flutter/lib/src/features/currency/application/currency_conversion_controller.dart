import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/currency_conversion_entity.dart';
import 'package:balance_home_app/src/features/currency/domain/repositories/currency_conversion_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrencyConversionController extends StateNotifier<AsyncValue<void>> {
  final CurrencyConversionRepositoryInterface currencyConversionRepository;

  CurrencyConversionController({required this.currencyConversionRepository})
      : super(const AsyncValue.data(null));

  Future<Either<Failure, double>> getCurrencyConversion(
      final double quantity,
      final String currencyFrom,
      final String currencyTo,
      final AppLocalizations appLocalizations) async {
    return (await currencyConversionRepository
            .getCurrencyConversion(currencyFrom))
        .fold(
            (failure) => left(UnprocessableValueFailure(
                detail: appLocalizations.genericError)), (value) {
      for (CurrencyConversionEntity conversion in value.exchanges) {
        if (conversion.code == currencyTo) {
          return right(
              ((quantity * conversion.value) * 100).roundToDouble() / 100.0);
        }
      }
      return left(
          UnprocessableValueFailure(detail: appLocalizations.genericError));
    });
  }
}
