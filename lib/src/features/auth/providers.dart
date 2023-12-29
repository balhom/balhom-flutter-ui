import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/auth/application/email_verification_use_case.dart';
import 'package:balhom/src/features/auth/application/login_use_case.dart';
import 'package:balhom/src/features/auth/application/logout_use_case.dart';
import 'package:balhom/src/features/auth/application/reset_password_use_case.dart';
import 'package:balhom/src/features/auth/application/silent_login_use_case.dart';
import 'package:balhom/src/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:balhom/src/features/auth/domain/repositories/email_verification_repository_interface.dart';
import 'package:balhom/src/features/auth/domain/repositories/reset_password_repository_interface.dart';
import 'package:balhom/src/features/auth/infrastructure/datasources/local/jwt_local_data_source.dart';
import 'package:balhom/src/features/auth/infrastructure/datasources/remote/email_verification_remote_data_source.dart';
import 'package:balhom/src/features/auth/infrastructure/datasources/remote/jwt_remote_data_source.dart';
import 'package:balhom/src/features/auth/infrastructure/datasources/remote/reset_password_remote_data_source.dart';
import 'package:balhom/src/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:balhom/src/features/auth/infrastructure/repositories/email_verification_repository.dart';
import 'package:balhom/src/features/auth/infrastructure/repositories/reset_password_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Infrastructure dependencies
///

final authRepositoryProvider = Provider<AuthRepositoryInterface>((ref) {
  return AuthRepository(
      jwtRemoteDataSource:
          JwtRemoteDataSource(apiClient: ref.read(balhomApiClientProvider)),
      jwtLocalDataSource: JwtLocalDataSource(
          storageClient: ref.read(localPreferencesClientProvider)));
});

final resetPasswordRepositoryProvider =
    Provider<ResetPasswordRepositoryInterface>((ref) {
  return ResetPasswordRepository(
    resetPasswordRemoteDataSource: ResetPasswordRemoteDataSource(
        apiClient: ref.read(balhomApiClientProvider)),
  );
});

final emailVerificationRepositoryProvider =
    Provider<EmailVerificationRepositoryInterface>((ref) {
  return EmailVerificationRepository(
    emailVerificationRemoteDataSource: EmailVerificationRemoteDataSource(
        apiClient: ref.read(balhomApiClientProvider)),
  );
});

///
/// Application dependencies
///

/// Provides a [ValueNotifier] to the app router to redirect on auth state change
final authStateListenable = ValueNotifier<bool>(false);

final loginUseCaseProvider =
    StateNotifierProvider<LoginUseCase, AsyncValue<void>>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return LoginUseCase(authRepository: authRepository);
});

final silentLoginUseCaseProvider =
    StateNotifierProvider<SilentLoginUseCase, AsyncValue<void>>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return SilentLoginUseCase(authRepository: authRepository);
});

final logoutUseCaseProvider =
    StateNotifierProvider<LogoutUseCase, AsyncValue<void>>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return LogoutUseCase(authRepository: authRepository);
});

final resetPasswordUseCaseProvider =
    StateNotifierProvider<ResetPasswordUseCase, AsyncValue<void>>((ref) {
  final resetPasswordRepository = ref.read(resetPasswordRepositoryProvider);
  return ResetPasswordUseCase(resetPasswordRepository: resetPasswordRepository);
});

final emailVerificationUseCaseProvider =
    StateNotifierProvider<EmailVerificationUseCase, AsyncValue<void>>((ref) {
  final emailVerificationRepository =
      ref.read(emailVerificationRepositoryProvider);
  return EmailVerificationUseCase(
      emailVerificationRepository: emailVerificationRepository);
});
