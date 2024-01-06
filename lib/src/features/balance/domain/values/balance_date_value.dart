import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/domain/failures/invalid_value_failure.dart';
import 'package:balhom/src/core/domain/values/value_abstract.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Balance Date value
class BalanceDateTimeValue extends ValueAbstract<DateTime?> {
  @override
  Either<Failure, DateTime> get value => _value;
  final Either<Failure, DateTime> _value;

  factory BalanceDateTimeValue(
      AppLocalizations appLocalizations, DateTime? input) {
    return BalanceDateTimeValue._(
      _validate(appLocalizations, input),
    );
  }

  const BalanceDateTimeValue._(this._value);
}

Either<Failure, DateTime> _validate(
    AppLocalizations appLocalizations, DateTime? input) {
  if (input != null &&
      DateTime(input.year, input.month, input.day).isBefore(DateTime.now())) {
    return right(input);
  }
  final String message = input == null
      ? appLocalizations.balanceDateRequired
      : appLocalizations.balanceDateFuture;
  return left(
    InvalidValueFailure(
      detail: message,
    ),
  );
}
