import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balance_home_app/src/core/domain/values/value_abstract.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Register Password value
class RegisterPasswordValue extends ValueAbstract<String> {
  @override
  Either<Failure, String> get value => _value;
  final Either<Failure, String> _value;

  factory RegisterPasswordValue(
      AppLocalizations appLocalizations, String input) {
    return RegisterPasswordValue._(
      _validate(appLocalizations, input),
    );
  }

  const RegisterPasswordValue._(this._value);
}

/// * minLength: 8
/// * no numeric password
Either<Failure, String> _validate(
    AppLocalizations appLocalizations, String input) {
  if (input.length >= 8 && !RegExp(r"^[1-9]*$").hasMatch(input)) {
    return right(input);
  }
  String message = input.isEmpty
      ? appLocalizations.needPassword
      : input.length < 8
          ? appLocalizations.shortPassword
          : appLocalizations.numericPassword;
  return left(
    UnprocessableValueFailure(
      detail: message,
    ),
  );
}
