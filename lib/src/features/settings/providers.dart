import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/account/providers.dart';
import 'package:balhom/src/features/settings/application/language_update_use_case.dart';
import 'package:balhom/src/features/settings/application/receive_email_update_use_case.dart';
import 'package:balhom/src/features/settings/application/theme_mode_update_use_case.dart';
import 'package:balhom/src/features/settings/domain/repositories/settings_repository_interface.dart';
import 'package:balhom/src/features/settings/infrastructure/datasources/local/theme_local_data_source.dart';
import 'package:balhom/src/features/settings/infrastructure/repositories/settings_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Infrastructure dependencies
///

final settingsRepositoryProvider = Provider<SettingsRepositoryInterface>((ref) {
  return SettingsRepository(
    themeLocalDataSource: ThemeLocalDataSource(
        storageClient: ref.read(localPreferencesClientProvider)),
  );
});

///
/// Application dependencies
///

final themeModeUpdateUseCaseProvider =
    StateNotifierProvider<ThemeModeUpdateUseCase, AsyncValue<void>>((ref) {
  final accountRepository = ref.read(accountRepositoryProvider);
  final settingsRepository = ref.read(settingsRepositoryProvider);
  return ThemeModeUpdateUseCase(
      accountRepository: accountRepository,
      settingsRepository: settingsRepository);
});

final languageUpdateUseCaseProvider =
    StateNotifierProvider<LanguageUpdateUseCase, AsyncValue<void>>((ref) {
  final accountRepository = ref.read(accountRepositoryProvider);
  final settingsRepository = ref.read(settingsRepositoryProvider);
  return LanguageUpdateUseCase(
      accountRepository: accountRepository,
      settingsRepository: settingsRepository);
});

final receiveEmailUpdateUseCaseProvider =
    StateNotifierProvider<ReceiveEmailUpdateUseCase, AsyncValue<void>>((ref) {
  final accountRepository = ref.read(accountRepositoryProvider);
  final settingsRepository = ref.read(settingsRepositoryProvider);
  return ReceiveEmailUpdateUseCase(
      accountRepository: accountRepository,
      settingsRepository: settingsRepository);
});
