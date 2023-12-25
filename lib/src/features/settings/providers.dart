import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/account/providers.dart';
import 'package:balhom/src/features/settings/application/settings_controller.dart';
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

final settingsControllerProvider =
    StateNotifierProvider<SettingsController, AsyncValue<void>>((ref) {
  final accountRepository = ref.read(accountRepositoryProvider);
  final settingsRepository = ref.read(settingsRepositoryProvider);
  return SettingsController(
      accountRepository: accountRepository,
      settingsRepository: settingsRepository);
});