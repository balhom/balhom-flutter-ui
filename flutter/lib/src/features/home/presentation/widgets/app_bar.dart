import 'package:balance_home_app/config/app_colors.dart';
import 'package:balance_home_app/src/core/utils/platform_utils.dart';
import 'package:balance_home_app/src/core/router.dart';
import 'package:balance_home_app/src/core/presentation/views/app_title.dart';
import 'package:balance_home_app/src/features/account/presentation/views/account_edit_view.dart';
import 'package:balance_home_app/src/features/account/providers.dart';
import 'package:balance_home_app/src/features/auth/presentation/views/logout_view.dart';
import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/features/account/domain/entities/account_entity.dart';
import 'package:balance_home_app/src/features/settings/presentation/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);

    final accountState = ref.watch(accountControllerProvider);
    final account = accountState.asData?.value;

    ref.read(accountControllerProvider.notifier);

    // TODO change to customized widget
    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white10,
          statusBarBrightness: Brightness.dark, //Dark icons for Android
          statusBarIconBrightness: Brightness.dark //Dark icons for iOS
          ),
      titleSpacing: 0,
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.appBarBackgroundColor,
      // If platform window is considered as large or medium, then the [AppTittle]
      // should be shown, otherwise if mobile is the current platform nothing will be shown,
      // else cases a balance counter should be rendered
      title: (PlatformUtils.isLargeWindow(context) ||
              PlatformUtils.isMediumWindow(context))
          ? const AppTitle(fontSize: 30)
          : _balanceBox(appLocalizations, account),
      leading: (PlatformUtils.isLargeWindow(context) ||
              PlatformUtils.isMediumWindow(context))
          ? _balanceBox(appLocalizations, account)
          : null,
      leadingWidth: (PlatformUtils.isLargeWindow(context) ||
              PlatformUtils.isMediumWindow(context))
          ? 250
          : 0,
      actions: [
        accountState.when(data: (account) {
          return _profileButton(appLocalizations, account);
        }, loading: () {
          return Container(
              margin: const EdgeInsets.all(5),
              child: const CircularProgressIndicator(strokeWidth: 5));
        }, error: (_, __) {
          return Container(
              margin: const EdgeInsets.all(5),
              child: const Icon(
                Icons.error_outline,
                color: Colors.red,
              ));
        })
      ],
    );
  }

  /// Returns a [Widget] that includes an account balance counter and
  /// the coint type setup in the account.
  Widget _balanceBox(
      AppLocalizations appLocalizations, AccountEntity? account) {
    return Container(
        width: 400,
        height: 100,
        color: const Color.fromARGB(255, 12, 12, 12),
        child: Center(
          child: Text(
            "${appLocalizations.balance}: ${account == null ? "-" : account.currentBalance} "
            "${account == null ? "" : account.prefCurrencyType}",
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.openSans(fontSize: 17, color: Colors.white),
          ),
        ));
  }

  /// Returns a [Widget] that includes a button with the image
  /// profile and name of the account.
  Widget _profileButton(
      AppLocalizations appLocalizations, AccountEntity? account) {
    final isConnected = connectionStateListenable.value;
    return PopupMenuButton(
      onSelected: (value) {
        if (value == 0) {
          router.pushNamed(AccountEditView.routeName);
        } else if (value == 1) {
          router.pushNamed(SettingsView.routeName);
        } else if (value == 2) {
          // It cannot call authController because it would change provider
          // while changing the entire three and that leads to an error
          router.goNamed(LogoutView.routeName);
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem<int>(
            value: 0,
            child: Text(appLocalizations.myAccount),
          ),
          if (isConnected)
            PopupMenuItem<int>(
              value: 1,
              child: Text(appLocalizations.settings),
            ),
          if (isConnected)
            PopupMenuItem<int>(
              value: 2,
              child: Text(appLocalizations.logout),
            ),
        ];
      },
      child: Row(
        children: [
          if (account != null)
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              margin: const EdgeInsets.all(4),
              child: account.image == null
                  ? const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    )
                  : Image.network(account.image!),
            ),
          if (account != null)
            if (!PlatformUtils.isMobile)
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  account.username,
                  style: GoogleFonts.openSans(
                      fontSize: 17,
                      color: const Color.fromARGB(255, 202, 202, 202)),
                ),
              )
        ],
      ),
    );
  }
}
