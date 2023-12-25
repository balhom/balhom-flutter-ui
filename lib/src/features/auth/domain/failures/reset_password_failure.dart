import 'package:balhom/src/core/domain/constants/requests_failure_constants.dart';
import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/domain/failures/http/api_bad_request_failure.dart';
import 'package:balhom/src/core/domain/failures/http/input_bad_request_failure.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordFailure extends Failure {
  const ResetPasswordFailure({required super.detail});

  factory ResetPasswordFailure.fromFailure(
      final Failure failure, final AppLocalizations appLocalizations) {
    // Bad Request Failure case
    if (failure is ApiBadRequestFailure) {
      switch (failure.errorCode) {
        case RequestsFailureConstants.userNotFountFailureCode:
          return ResetPasswordFailure(detail: appLocalizations.emailNotValid);
        case RequestsFailureConstants.unverifiedEmailFailureCode:
          return ResetPasswordFailure(
              detail: appLocalizations.emailNotVerified);
        case RequestsFailureConstants.resetPasswordTooManyTriesFailureCode:
          return ResetPasswordFailure(
              detail: appLocalizations.resetPasswordTooManyTries);
        default:
      }
    }
    // Input Bad Request Failure case
    else if (failure is InputBadRequestFailure) {
      if (failure.containsFieldName("email")) {
        return ResetPasswordFailure(detail: appLocalizations.emailNotValid);
      }
    }
    return ResetPasswordFailure(detail: appLocalizations.genericError);
  }
}
