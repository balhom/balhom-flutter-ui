import 'package:balhom/src/core/domain/constants/requests_failure_constants.dart';
import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/domain/failures/http/api_bad_request_failure.dart';
import 'package:balhom/src/core/domain/failures/http/input_bad_request_failure.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailVerificationFailure extends Failure {
  const EmailVerificationFailure({required super.detail});

  factory EmailVerificationFailure.fromFailure(
      final Failure failure, final AppLocalizations appLocalizations) {
    // Bad Request Failure case
    if (failure is ApiBadRequestFailure) {
      switch (failure.errorCode) {
        case RequestsFailureConstants.userNotFountFailureCode:
          return EmailVerificationFailure(
              detail: appLocalizations.emailNotValid);
        default:
      }
    }
    // Input Bad Request Failure case
    else if (failure is InputBadRequestFailure) {
      if (failure.containsFieldName("email")) {
        return EmailVerificationFailure(detail: appLocalizations.emailNotValid);
      }
    }
    return EmailVerificationFailure(detail: appLocalizations.genericError);
  }
}
