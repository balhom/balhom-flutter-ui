import 'package:balhom/src/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:balhom/src/features/auth/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State usecase for silent login
class SilentLoginUseCase extends StateNotifier<AsyncValue<void>> {
  final AuthRepositoryInterface authRepository;

  SilentLoginUseCase({required this.authRepository})
      : super(const AsyncValue.data(null));

  Future<void> handle() async {
    state = const AsyncValue.loading();
    final res = await authRepository.trySignIn();
    await res.fold((failure) async {
      state = AsyncValue.error(failure, StackTrace.empty);
    }, (_) async {
      state = const AsyncValue.data(null);
      authStateListenable.value = true;
    });
  }
}
