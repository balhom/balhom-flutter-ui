import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/domain/failures/invalid_value_failure.dart';
import 'package:balhom/src/core/domain/values/value_abstract.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Balance Quanity value
class BalanceQuantityValue extends ValueAbstract<double?> {
  @override
  Either<Failure, double> get value => _value;
  final Either<Failure, double> _value;

  factory BalanceQuantityValue(
      AppLocalizations appLocalizations, double? input) {
    return BalanceQuantityValue._(
      _validate(appLocalizations, input),
    );
  }

  const BalanceQuantityValue._(this._value);
}

/// * minimum: 0
Either<Failure, double> _validate(
    AppLocalizations appLocalizations, double? input) {
  if (input != null && input >= 0) {
    return right(input);
  }
  String message = input == null
      ? appLocalizations.balanceQuantityRequired
      : appLocalizations.balanceQuantityMinValue;
  return left(
    InvalidValueFailure(
      detail: message,
    ),
  );
}
