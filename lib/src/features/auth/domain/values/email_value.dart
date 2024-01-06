import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/domain/failures/invalid_value_failure.dart';
import 'package:balhom/src/core/domain/values/value_abstract.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Email value
class EmailValue extends ValueAbstract<String> {
  @override
  Either<Failure, String> get value => _value;
  final Either<Failure, String> _value;

  factory EmailValue(AppLocalizations appLocalizations, String input) {
    return EmailValue._(
      _validate(appLocalizations, input),
    );
  }

  const EmailValue._(this._value);
}

/// * minLength: 1
/// * valid email regex
Either<Failure, String> _validate(
    AppLocalizations appLocalizations, String input) {
  if (input.isNotEmpty &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(input)) {
    return right(input);
  }
  String message = input.isEmpty
      ? appLocalizations.needEmail
      : appLocalizations.emailNotValid;
  return left(
    InvalidValueFailure(
      detail: message,
    ),
  );
}
