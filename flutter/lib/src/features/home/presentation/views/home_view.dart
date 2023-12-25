import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:balance_home_app/src/core/presentation/widgets/app_will_pop_scope.dart';
import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/core/utils/platform_utils.dart';
import 'package:balance_home_app/src/features/balance/presentation/views/balance_view.dart';
import 'package:balance_home_app/src/features/currency/providers.dart';
import 'package:balance_home_app/src/features/home/presentation/views/home_tabs.dart';
import 'package:balance_home_app/src/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:balance_home_app/src/features/statistics/presentation/views/statistics_view.dart';
import 'package:balance_home_app/src/features/statistics/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends ConsumerStatefulWidget {
  final HomeTabEnum selectedSection;
  final Widget child;

  const HomeView(
      {required this.selectedSection, required this.child, super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    final isConnected = connectionStateListenable.value;
    if (!isConnected) {
      Future.delayed(Duration.zero, () {
        showNoConnectionSnackBar(appLocalizations);
      });
    }
    return AppPopScope(
      snackBarText: appLocalizations.exitRepeatMessage,
      child: AdaptiveNavigationScaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(40), child: CustomAppBar()),
        resizeToAvoidBottomInset: false,
        body: SafeArea(child: widget.child),
        selectedIndex: widget.selectedSection.index,
        onDestinationSelected: (int index) {
          switch (HomeTabEnum.values[index]) {
            case HomeTabEnum.statistics:
              final selectedDate =
                  ref.read(statisticsBalanceSelectedDateProvider);

              ref
                  .read(monthlyBalanceListControllerProvider.notifier)
                  .get(selectedDate);
              ref
                  .read(annualBalanceListControllerProvider.notifier)
                  .get(selectedDate);
              ref.read(statisticsControllerProvider.notifier).get(selectedDate);
              ref
                  .read(daysCurrencyConversionsControllerProvider.notifier)
                  .get(20);

              context.go("/${StatisticsView.routePath}");
              break;
            case HomeTabEnum.revenues:
              context.go("/${BalanceView.routeRevenuePath}");
              break;
            case HomeTabEnum.expenses:
              context.go("/${BalanceView.routeExpensePath}");
              break;
          }
        },
        destinations: [
          AdaptiveScaffoldDestination(
            icon: Icons.insert_chart_outlined_sharp,
            title: appLocalizations.statistics,
          ),
          AdaptiveScaffoldDestination(
            icon: Icons.trending_up,
            title: appLocalizations.revenues,
          ),
          AdaptiveScaffoldDestination(
            icon: Icons.trending_down,
            title: appLocalizations.expenses,
          ),
        ],
        navigationTypeResolver: navigationTypeResolver,
      ),
    );
  }

  @visibleForTesting
  NavigationType navigationTypeResolver(BuildContext context) {
    if (PlatformUtils.isLargeWindow(context) ||
        PlatformUtils.isMediumWindow(context)) {
      return NavigationType.rail;
    } else {
      return NavigationType.bottom;
    }
  }

  @visibleForTesting
  void showNoConnectionSnackBar(final AppLocalizations appLocalizations) {
    final snackBar = SnackBar(
        content:
            Text(appLocalizations.noConnection, textAlign: TextAlign.center),
        backgroundColor: Colors.grey,
        duration: const Duration(seconds: 3));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
