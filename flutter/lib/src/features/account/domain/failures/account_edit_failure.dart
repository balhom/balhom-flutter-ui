import 'package:balance_home_app/src/core/domain/constants/requests_failure_constants.dart';
import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/api_bad_request_failure.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountEditFailure extends Failure {
  const AccountEditFailure({required super.detail});

  factory AccountEditFailure.fromFailure(
      final Failure failure, final AppLocalizations appLocalizations) {
    // Bad Request Failure case
    if (failure is ApiBadRequestFailure) {
      switch (failure.errorCode) {
        case RequestsFailureConstants.prefCurrencyTypeError:
          return AccountEditFailure(
              detail: appLocalizations.accountEditPrefCurrencyTypeError);
        case RequestsFailureConstants.usernameAlreadyUsedFailureCode:
          return AccountEditFailure(detail: appLocalizations.usernameUsed);
        default:
      }
    }
    return AccountEditFailure(detail: appLocalizations.genericError);
  }
}
