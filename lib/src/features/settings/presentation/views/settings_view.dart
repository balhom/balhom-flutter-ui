import 'package:balhom/config/app_colors.dart';
import 'package:balhom/src/core/presentation/views/app_scaffold.dart';
import 'package:balhom/src/core/router.dart';
import 'package:balhom/src/core/presentation/views/app_title.dart';
import 'package:balhom/src/features/account/providers.dart';
import 'package:balhom/src/features/auth/presentation/views/auth_background_view.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/settings/presentation/widgets/settings_widget.dart';
import 'package:balhom/src/features/statistics/presentation/views/statistics_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsView extends ConsumerWidget {
  /// Route name
  static const routeName = 'settings';

  /// Route path
  static const routePath = 'settings';
  @visibleForTesting
  final cache = ValueNotifier<Widget>(Container());

  SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);

    final accountGetState = ref.watch(accountGetUseCaseProvider);

    return accountGetState.when(data: (data) {
      cache.value = AppScaffold(
          appBar: AppBar(
            title: const AppTitle(fontSize: 30),
            backgroundColor: AppColors.appBarBackgroundColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => router.goNamed(StatisticsView.routeName),
            ),
          ),
          body: SafeArea(
              child: AuthBackgroundWidget(
            child: SettingsWidget(account: data!),
          )));
      return cache.value;
    }, error: (error, st) {
      return showError(
          error: error,
          background: cache.value,
          text: appLocalizations.genericError);
    }, loading: () {
      return showLoading(background: cache.value);
    });
  }
}
