import 'package:balhom/src/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:balhom/src/features/auth/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State use case for logout
class LogoutUseCase extends StateNotifier<AsyncValue<void>> {
  final AuthRepositoryInterface authRepository;

  LogoutUseCase({required this.authRepository})
      : super(const AsyncValue.data(null));

  Future<void> handle() async {
    state = const AsyncValue.loading();
    final res = await authRepository.logout();
    state = res.fold((failure) => AsyncError(failure, StackTrace.empty),
        (_) => const AsyncValue.data(null));
    authStateListenable.value = false;
  }
}
