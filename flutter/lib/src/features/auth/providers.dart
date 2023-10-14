import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/features/auth/application/auth_controller.dart';
import 'package:balance_home_app/src/features/auth/application/email_verification_controller.dart';
import 'package:balance_home_app/src/features/auth/application/reset_password_controller.dart';
import 'package:balance_home_app/src/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:balance_home_app/src/features/auth/domain/repositories/email_verification_repository_interface.dart';
import 'package:balance_home_app/src/features/auth/domain/repositories/reset_password_repository_interface.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/datasources/local/jwt_local_data_source.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/datasources/remote/email_verification_remote_data_source.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/datasources/remote/jwt_remote_data_source.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/datasources/remote/reset_password_remote_data_source.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/repositories/email_verification_repository.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/repositories/reset_password_repository.dart';
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

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return AuthController(authRepository: authRepository);
});

final resetPasswordControllerProvider =
    StateNotifierProvider<ResetPasswordController, AsyncValue<void>>((ref) {
  final resetPasswordRepository = ref.read(resetPasswordRepositoryProvider);
  return ResetPasswordController(
      resetPasswordRepository: resetPasswordRepository);
});

final emailVerificationControllerProvider =
    StateNotifierProvider<EmailVerificationController, AsyncValue<void>>((ref) {
  final emailVerificationRepository =
      ref.read(emailVerificationRepositoryProvider);
  return EmailVerificationController(
      emailVerificationRepository: emailVerificationRepository);
});
