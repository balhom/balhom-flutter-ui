import 'package:balance_home_app/src/core/domain/constants/requests_failure_constants.dart';
import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/api_bad_request_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/input_bad_request_failure.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginFailure extends Failure {
  const LoginFailure({required super.detail});

  factory LoginFailure.fromFailure(
      final Failure failure, final AppLocalizations appLocalizations) {
    // Bad Request Failure case
    if (failure is ApiBadRequestFailure) {
      switch (failure.errorCode) {
        case RequestsFailureConstants.wrongCredentialsFailureCode:
          return LoginFailure(detail: appLocalizations.wrongCredentials);
        case RequestsFailureConstants.unverifiedEmailFailureCode:
          return LoginFailure(detail: appLocalizations.emailNotVerified);
        default:
      }
    }
    // Input Bad Request Failure case
    else if (failure is InputBadRequestFailure) {
      if (failure.containsFieldName("email")) {
        return LoginFailure(detail: appLocalizations.emailNotValid);
      }
    }
    return LoginFailure(detail: appLocalizations.genericError);
  }
}
