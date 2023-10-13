import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balance_home_app/src/core/domain/values/value_abstract.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Login User Password value
class LoginPasswordValue extends ValueAbstract<String> {
  @override
  Either<Failure, String> get value => _value;
  final Either<Failure, String> _value;

  factory LoginPasswordValue(AppLocalizations appLocalizations, String input) {
    return LoginPasswordValue._(
      _validate(appLocalizations, input),
    );
  }

  const LoginPasswordValue._(this._value);
}

/// * minLength: 1
Either<Failure, String> _validate(
    AppLocalizations appLocalizations, String input) {
  if (input.isNotEmpty) {
    return right(input);
  }
  return left(
    UnprocessableValueFailure(
      detail: appLocalizations.needPassword,
    ),
  );
}
