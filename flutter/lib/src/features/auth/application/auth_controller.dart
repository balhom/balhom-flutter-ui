import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/api_bad_request_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/unauthorized_request_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balance_home_app/src/features/auth/domain/dtos/login_values_dto.dart';
import 'package:balance_home_app/src/features/account/domain/entities/account_entity.dart';
import 'package:balance_home_app/src/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:balance_home_app/src/features/auth/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// State controller for authentication
class AuthController extends StateNotifier<AsyncValue<AccountEntity?>> {
  final AuthRepositoryInterface authRepository;

  AuthController({required this.authRepository})
      : super(const AsyncValue.data(null));

  Future<Either<Failure, void>> trySignIn() async {
    state = const AsyncValue.loading();
    final res = await authRepository.trySignIn();
    return await res.fold((failure) {
      state = const AsyncValue.data(null);
      return left(failure);
    }, (_) async {
      final res = await authRepository.getUser();
      return res.fold((failure) {
        state = const AsyncValue.data(null);
        return left(failure);
      }, (value) {
        state = AsyncValue.data(value);
        updateAuthState();
        return right(null);
      });
    });
  }

  Future<Either<Failure, void>> login(final LoginValuesDto loginValuesDto,
      final AppLocalizations appLocalizations,
      {bool rememberMe = false}) async {
    state = const AsyncValue.loading();
    return loginValuesDto.toEntity().fold((failure) {
      state = const AsyncValue.data(null);
      return left(failure);
    }, (credentialsEntity) async {
      final res = await authRepository.login(credentialsEntity, store: rememberMe);
      return res.fold((failure) {
        state = const AsyncValue.data(null);
        if (failure is ApiBadRequestFailure) {
          if (failure.errorCode == unverifiedEmailFailure) {
            return left(UnprocessableValueFailure(
                detail: appLocalizations.emailNotVerified));
          }
          return left(UnprocessableValueFailure(detail: failure.detail));
        } else if (failure is InputBadRequestFailure) {
          if (failure.containsFieldName("email")) {
            return left(UnprocessableValueFailure(
                detail: appLocalizations.emailNotValid));
          }
        } else if (failure is UnauthorizedRequestFailure) {
          return left(UnprocessableValueFailure(
              detail: appLocalizations.wrongCredentials));
        }
        return left(
            UnprocessableValueFailure(detail: appLocalizations.genericError));
      }, (_) async {
        final res = await authRepository.getUser();
        return res.fold(
            (failure) => left(UnprocessableValueFailure(
                detail: appLocalizations.genericError)), (value) {
          state = AsyncValue.data(value);
          updateAuthState();
          return right(null);
        });
      });
    });
  }

  /// Signs out user
  Future<Either<Failure, void>> logout() async {
    final res = await authRepository.logout();
    if (res.isLeft()) return res;
    state = const AsyncValue.data(null);
    updateAuthState();
    return right(null);
  }

  @visibleForTesting
  void updateAuthState() {
    authStateListenable.value = state.hasValue && state.asData!.value != null;
  }
}
