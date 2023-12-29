import 'package:balhom/config/app_theme.dart';
import 'package:balhom/src/core/domain/failures/failure.dart';
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

    final accountGetUseCase = ref.read(accountGetUseCaseProvider.notifier);

    final languageUpdateState = ref.watch(languageUpdateUseCaseProvider);
    final themeModeUpdateState = ref.watch(themeModeUpdateUseCaseProvider);
    final receiveEmailUpdateState =
        ref.watch(receiveEmailUpdateUseCaseProvider);

    final languageUpdateUseCase =
        ref.read(languageUpdateUseCaseProvider.notifier);
    final themeModeUpdateUseCase =
        ref.read(themeModeUpdateUseCaseProvider.notifier);
    final receiveEmailUpdateUseCase =
        ref.read(receiveEmailUpdateUseCaseProvider.notifier);

    final theme = ref.watch(themeDataProvider);
    final themeStateNotifier = ref.read(themeDataProvider.notifier);
    final appLocalizationStateNotifier =
        ref.read(appLocalizationsProvider.notifier);

    if (languageUpdateState.isLoading ||
        themeModeUpdateState.isLoading ||
        receiveEmailUpdateState.isLoading) {
      return showLoading(background: cache.value);
    }
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
                    color: const Color.fromARGB(255, 70, 70, 70), fontSize: 18),
              ),
              horizontalSpace(),
              AppLanguagePickerDropdown(
                  appLocalizations: appLocalizations,
                  onValuePicked: (Language language) async {
                    Locale locale = Locale(language.isoCode);
                    appLocalizationStateNotifier.setLocale(locale);
                    await languageUpdateUseCase.handle(
                        account, locale, appLocalizations);
                    final languageUpdateState =
                        ref.read(languageUpdateUseCaseProvider);
                    if (languageUpdateState.hasError) {
                      final failure = languageUpdateState.error as Failure;
                      showErrorSettingsDialog(appLocalizations, failure.detail);
                    } else {
                      accountGetUseCase.handle();
                    }
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
                await themeModeUpdateUseCase.handle(
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
                await receiveEmailUpdateUseCase.handle(
                    account, value!, appLocalizations);
                accountGetUseCase.handle();
              }),
          verticalSpace(),
        ],
      ),
    );
    return cache.value;
  }
}
