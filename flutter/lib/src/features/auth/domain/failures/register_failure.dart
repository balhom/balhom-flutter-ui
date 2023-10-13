import 'package:balance_home_app/src/core/domain/failures/api_bad_request_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/input_bad_request_failure.dart';
import 'package:balance_home_app/src/features/auth/domain/failures/register_failure_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterFailure extends Failure {
  const RegisterFailure({required super.detail});

  factory RegisterFailure.fromFailure(
      final Failure failure, final AppLocalizations appLocalizations) {
    // Bad Request Failure case
    if (failure is ApiBadRequestFailure) {
      switch (failure.errorCode) {
        case emailAlreadyUsedFailureCode:
          return RegisterFailure(detail: appLocalizations.emailUsed);
        default:
      }
    }
    // Input Bad Request Failure case
    else if (failure is InputBadRequestFailure) {
      if (failure.containsFieldName("password")) {
        return RegisterFailure(detail: appLocalizations.passwordTooCommon);
      }
    }
    return RegisterFailure(detail: appLocalizations.genericError);
  }
}
