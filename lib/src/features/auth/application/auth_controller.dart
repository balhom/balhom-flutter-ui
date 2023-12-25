import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/auth/domain/dtos/login_values_dto.dart';
import 'package:balhom/src/features/auth/domain/failures/login_failure.dart';
import 'package:balhom/src/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:balhom/src/features/auth/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// State controller for authentication
class AuthController extends StateNotifier<AsyncValue<void>> {
  final AuthRepositoryInterface authRepository;

  AuthController({required this.authRepository})
      : super(const AsyncValue.data(null));

  Future<Either<Failure, void>> trySignIn() async {
    state = const AsyncValue.loading();
    debugPrint("Trying to sign in");
    final res = await authRepository.trySignIn();
    return await res.fold((failure) {
      state = const AsyncValue.data(null);
      return left(failure);
    }, (_) async {
      state = const AsyncValue.data(null);
      updateAuthState(true);
      return right(null);
    });
  }

  Future<Either<Failure, void>> login(final LoginValuesDto loginValuesDto,
      final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    return loginValuesDto.toEntity().fold((failure) {
      state = const AsyncValue.data(null);
      return left(failure);
    }, (credentialsEntity) async {
      final res = await authRepository.login(credentialsEntity);
      return res.fold((failure) {
        state = const AsyncValue.data(null);
        return left(LoginFailure.fromFailure(failure, appLocalizations));
      }, (_) async {
        state = const AsyncValue.data(null);
        updateAuthState(true);
        return right(null);
      });
    });
  }

  Future<Either<Failure, void>> logout() async {
    final res = await authRepository.logout();
    if (res.isLeft()) return res;
    state = const AsyncValue.data(null);
    updateAuthState(false);
    return right(null);
  }

  @visibleForTesting
  void updateAuthState(final bool state) {
    authStateListenable.value = state;
  }
}
