import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/features/auth/application/auth_controller.dart';
import 'package:balance_home_app/src/features/auth/application/reset_password_controller.dart';
import 'package:balance_home_app/src/features/account/application/account_controller.dart';
import 'package:balance_home_app/src/features/account/domain/entities/account_entity.dart';
import 'package:balance_home_app/src/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:balance_home_app/src/features/auth/domain/repositories/reset_password_repository_interface.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/datasources/local/jwt_local_data_source.dart';
import 'package:balance_home_app/src/features/account/infrastructure/datasources/local/account_local_data_source.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/datasources/remote/jwt_remote_data_source.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/datasources/remote/reset_password_remote_data_source.dart';
import 'package:balance_home_app/src/features/account/infrastructure/datasources/remote/account_remote_data_source.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/repositories/reset_password_repository.dart';
import 'package:balance_home_app/src/features/currency/providers.dart';
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
          storageClient: ref.read(localPreferencesClientProvider)),
      userRemoteDataSource:
          AccountRemoteDataSource(apiClient: ref.read(balhomApiClientProvider)),
      userLocalDataSource:
          UserLocalDataSource(localDbClient: ref.read(localDbClientProvider)));
});

final resetPasswordRepositoryProvider =
    Provider<ResetPasswordRepositoryInterface>((ref) {
  return ResetPasswordRepository(
    resetPasswordRemoteDataSource: ResetPasswordRemoteDataSource(
        apiClient: ref.read(balhomApiClientProvider)),
  );
});

///
/// Application dependencies
///

/// Provides a [ValueNotifier] to the app router to redirect on auth state change
final authStateListenable = ValueNotifier<bool>(false);

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<AccountEntity?>>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return AuthController(authRepository: repo);
});

final resetPasswordControllerProvider = StateNotifierProvider<
    ResetPasswordController, AsyncValue<ResetPasswordProgress>>((ref) {
  final repo = ref.read(resetPasswordRepositoryProvider);
  return ResetPasswordController(repo);
});
