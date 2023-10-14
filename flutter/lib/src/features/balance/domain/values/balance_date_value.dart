import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balance_home_app/src/core/domain/values/value_abstract.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Balance Date value
class BalanceDateValue extends ValueAbstract<DateTime?> {
  @override
  Either<Failure, DateTime> get value => _value;
  final Either<Failure, DateTime> _value;

  factory BalanceDateValue(AppLocalizations appLocalizations, DateTime? input) {
    return BalanceDateValue._(
      _validate(appLocalizations, input),
    );
  }

  const BalanceDateValue._(this._value);
}

/// * minimum: 0
Either<Failure, DateTime> _validate(
    AppLocalizations appLocalizations, DateTime? input) {
  if (input != null && !input.isAfter(DateTime.now())) {
    return right(input);
  }
  String message = input == null
      ? appLocalizations.balanceDateRequired
      : appLocalizations.balanceDateFuture;
  return left(
    UnprocessableValueFailure(
      detail: message,
    ),
  );
}
