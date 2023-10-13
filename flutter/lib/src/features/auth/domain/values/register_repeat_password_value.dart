import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balance_home_app/src/core/domain/values/value_abstract.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Register Repeat Password value
class RegisterRepeatPasswordValue extends ValueAbstract<String> {
  @override
  Either<Failure, String> get value => _value;
  final Either<Failure, String> _value;

  factory RegisterRepeatPasswordValue(
      AppLocalizations appLocalizations, String input1, String input2) {
    return RegisterRepeatPasswordValue._(
      _validate(appLocalizations, input1, input2),
    );
  }

  const RegisterRepeatPasswordValue._(this._value);
}

/// * minLength: 1
/// * [input1] == [input2]
Either<Failure, String> _validate(
    AppLocalizations appLocalizations, String input1, String input2) {
  if (input2.isNotEmpty && input1 == input2) {
    return right(input2);
  }
  String message = input2.isEmpty
      ? appLocalizations.needRepeatedPassword
      : appLocalizations.passwordNotMatch;
  return left(
    UnprocessableValueFailure(
      detail: message,
    ),
  );
}
