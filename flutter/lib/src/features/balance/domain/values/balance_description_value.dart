import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balance_home_app/src/core/domain/values/value_abstract.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Balance Description value
class BalanceDescriptionValue extends ValueAbstract<String> {
  @override
  Either<Failure, String> get value => _value;
  final Either<Failure, String> _value;

  factory BalanceDescriptionValue(
      AppLocalizations appLocalizations, String input) {
    return BalanceDescriptionValue._(
      _validate(appLocalizations, input),
    );
  }

  const BalanceDescriptionValue._(this._value);
}

/// * maxLength: 2000
Either<Failure, String> _validate(
    AppLocalizations appLocalizations, String input) {
  if (input.length <= 2000) {
    return right(input);
  }
  return left(
    UnprocessableValueFailure(
      detail: appLocalizations.balanceDescriptionMaxLength,
    ),
  );
}
