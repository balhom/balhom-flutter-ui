import 'package:balance_home_app/src/core/domain/failures/api_bad_request_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/input_bad_request_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balance_home_app/src/features/auth/domain/failures/register_failure_constants.dart';
import 'package:balance_home_app/src/features/auth/domain/repositories/reset_password_repository_interface.dart';
import 'package:balance_home_app/src/features/auth/domain/values/email_value.dart';
import 'package:balance_home_app/src/features/auth/domain/values/register_password_value.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordController
    extends StateNotifier<AsyncValue<ResetPasswordProgress>> {
  final ResetPasswordRepositoryInterface _repository;

  ResetPasswordController(this._repository)
      : super(const AsyncValue.data(ResetPasswordProgress.none));

  void resetProgress() {
    state = const AsyncValue.data(ResetPasswordProgress.none);
  }

  Future<Either<Failure, bool>> requestCode(
      EmailValue email, AppLocalizations appLocalizations,
      {bool retry = false}) async {
    state = const AsyncValue.loading();
    return await email.value.fold((failure) {
      state = !retry
          ? const AsyncValue.data(ResetPasswordProgress.none)
          : const AsyncValue.data(ResetPasswordProgress.started);
      return left(failure);
    }, (email) async {
      final res = await _repository.requestCode(email);
      return res.fold((failure) {
        state = !retry
            ? const AsyncValue.data(ResetPasswordProgress.none)
            : const AsyncValue.data(ResetPasswordProgress.started);
        if (failure is ApiBadRequestFailure) {
          if (failure.errorCode == resetPasswordRetriesFailure) {
            return left(UnprocessableValueFailure(
                detail: appLocalizations.resetPasswordTooManyTries));
          }
          return left(UnprocessableValueFailure(detail: failure.detail));
        } else if (failure is InputBadRequestFailure) {
          if (failure.containsFieldName("email")) {
            return left(UnprocessableValueFailure(
                detail: appLocalizations.emailNotValid));
          } else if (failure.containsFieldName("inv_code")) {
            return left(UnprocessableValueFailure(
                detail: appLocalizations.invitationCodeNotValid));
          } else if (failure.containsFieldName("email")) {
            return left(
                UnprocessableValueFailure(detail: appLocalizations.emailUsed));
          } else if (failure.containsFieldName("username")) {
            return left(UnprocessableValueFailure(
                detail: appLocalizations.usernameUsed));
          }
        }
        return left(UnprocessableValueFailure(
            detail: appLocalizations.errorSendingCode));
      }, (_) {
        state = const AsyncValue.data(ResetPasswordProgress.started);
        return right(true);
      });
    });
  }

  Future<Either<Failure, bool>> verifyCode(
      EmailValue email,
      VerificationCode code,
      RegisterPasswordValue password,
      AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    return await email.value.fold((failure) {
      state = const AsyncValue.data(ResetPasswordProgress.started);
      return left(failure);
    }, (email) async {
      return await code.value.fold((failure) {
        state = const AsyncValue.data(ResetPasswordProgress.started);
        return left(failure);
      }, (code) async {
        return await password.value.fold((failure) {
          state = const AsyncValue.data(ResetPasswordProgress.started);
          return left(failure);
        }, (password) async {
          final res = await _repository.verifyCode(ResetPasswordEntity(
              email: email, newPassword: password, code: code));
          return res.fold((failure) {
            state = const AsyncValue.data(ResetPasswordProgress.started);
            if (failure is ApiBadRequestFailure) {
              return left(UnprocessableValueFailure(detail: failure.detail));
            } else if (failure is InputBadRequestFailure) {
              if (failure.containsFieldName("new_password")) {
                return left(UnprocessableValueFailure(
                    detail: failure.getFieldDetail("new_password")));
              } else if (failure.containsFieldName("code")) {
                return left(UnprocessableValueFailure(
                    detail: failure.getFieldDetail("code")));
              }
            }
            return left(UnprocessableValueFailure(
                detail: appLocalizations.errorVerifyingCode));
          }, (_) {
            state = const AsyncValue.data(ResetPasswordProgress.verified);
            return right(true);
          });
        });
      });
    });
  }
}

enum ResetPasswordProgress { none, started, verified }
