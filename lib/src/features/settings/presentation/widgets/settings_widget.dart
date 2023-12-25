import 'package:balhom/config/app_theme.dart';
import 'package:balhom/src/core/presentation/widgets/app_language_picker_dropdown.dart';
import 'package:balhom/src/core/presentation/widgets/app_text_check_box.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/account/domain/entities/account_entity.dart';
import 'package:balhom/src/features/account/providers.dart';
import 'package:balhom/src/features/settings/presentation/utils/dialog_utils.dart';
import 'package:balhom/src/features/settings/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_picker/languages.dart';

class SettingsWidget extends ConsumerWidget {
  final AccountEntity account;

  final cache = ValueNotifier<Widget>(Container());

  SettingsWidget({
    required this.account,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);

    final accountController = ref.read(accountControllerProvider.notifier);

    final settings = ref.watch(settingsControllerProvider);
    final settingsController = ref.read(settingsControllerProvider.notifier);

    final theme = ref.watch(themeDataProvider);
    final themeStateNotifier = ref.read(themeDataProvider.notifier);
    final appLocalizationStateNotifier =
        ref.read(appLocalizationsProvider.notifier);
    // This is used to refresh page in case handle controller
    return settings.when(data: (_) {
      cache.value = Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            verticalSpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  appLocalizations.language,
                  style: GoogleFonts.openSans(
                      color: const Color.fromARGB(255, 70, 70, 70),
                      fontSize: 18),
                ),
                horizontalSpace(),
                AppLanguagePickerDropdown(
                    appLocalizations: appLocalizations,
                    onValuePicked: (Language language) async {
                      Locale locale = Locale(language.isoCode);
                      appLocalizationStateNotifier.setLocale(locale);
                      (await settingsController.updateLanguage(
                              account, locale, appLocalizations))
                          .fold((failure) {
                        showErrorSettingsDialog(
                            appLocalizations, failure.detail);
                      }, (_) {
                        accountController.get();
                      });
                    }),
              ],
            ),
            verticalSpace(),
            verticalSpace(),
            AppTextCheckBox(
                title: appLocalizations.darkMode,
                isChecked: theme == AppTheme.darkTheme,
                fillColor: const Color.fromARGB(255, 70, 70, 70),
                onChanged: (value) async {
                  themeStateNotifier.setThemeData(value != null && value
                      ? AppTheme.darkTheme
                      : AppTheme.lightTheme);
                  await settingsController.updateThemeMode(
                      value! ? AppTheme.darkTheme : AppTheme.lightTheme,
                      appLocalizations);
                }),
            verticalSpace(),
            verticalSpace(),
            AppTextCheckBox(
                title: appLocalizations.receiveEmailBalance,
                isChecked: account.receiveEmailBalance,
                fillColor: const Color.fromARGB(255, 70, 70, 70),
                onChanged: (value) async {
                  await settingsController.updateReceiveEmailBalance(
                      account, value!, appLocalizations);
                  accountController.get();
                }),
            verticalSpace(),
          ],
        ),
      );
      return cache.value;
    }, error: (error, stackTrace) {
      return showError(
          error: error,
          background: cache.value,
          text: appLocalizations.genericError);
    }, loading: () {
      return showLoading(background: cache.value);
    });
  }
}
