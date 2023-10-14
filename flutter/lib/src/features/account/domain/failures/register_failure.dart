import 'package:balance_home_app/src/core/domain/constants/requests_failure_constants.dart';
import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/api_bad_request_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/input_bad_request_failure.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterFailure extends Failure {
  const RegisterFailure({required super.detail});

  factory RegisterFailure.fromFailure(
      final Failure failure, final AppLocalizations appLocalizations) {
    // Bad Request Failure case
    if (failure is ApiBadRequestFailure) {
      switch (failure.errorCode) {
        case RequestsFailureConstants.emailAlreadyUsedFailureCode:
          return RegisterFailure(detail: appLocalizations.emailUsed);
        case RequestsFailureConstants.usernameAlreadyUsedFailureCode:
          return RegisterFailure(detail: appLocalizations.usernameUsed);
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
