import 'package:balhom/src/features/auth/domain/dtos/login_values_dto.dart';
import 'package:balhom/src/features/auth/domain/failures/login_failure.dart';
import 'package:balhom/src/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:balhom/src/features/auth/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// State usecase for login
class LoginUseCase extends StateNotifier<AsyncValue<void>> {
  final AuthRepositoryInterface authRepository;

  LoginUseCase({required this.authRepository})
      : super(const AsyncValue.data(null));

  Future<void> handle(final LoginValuesDto loginValuesDto,
      final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    await loginValuesDto.toEntity().fold((failure) async {
      state = AsyncValue.error(failure, StackTrace.empty);
    }, (credentialsEntity) async {
      final res = await authRepository.login(credentialsEntity);
      res.fold((failure) {
        state = AsyncValue.error(
            LoginFailure.fromFailure(failure, appLocalizations),
            StackTrace.empty);
      }, (_) async {
        state = const AsyncValue.data(null);
        authStateListenable.value = true;
      });
    });
  }
}
