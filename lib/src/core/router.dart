import 'dart:async';
import 'package:balhom/src/core/presentation/views/app_error_view.dart';
import 'package:balhom/src/core/presentation/views/app_loading_view.dart';
import 'package:balhom/src/core/presentation/views/fade_transition_view.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/account/presentation/views/account_delete_view.dart';
import 'package:balhom/src/features/account/presentation/views/account_edit_view.dart';
import 'package:balhom/src/features/auth/presentation/views/auth_loading_view.dart';
import 'package:balhom/src/features/auth/presentation/views/auth_view.dart';
import 'package:balhom/src/features/auth/presentation/views/logout_view.dart';
import 'package:balhom/src/features/auth/providers.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/presentation/views/balance_create_view.dart';
import 'package:balhom/src/features/balance/presentation/views/balance_edit_view.dart';
import 'package:balhom/src/features/balance/presentation/views/balance_view.dart';
import 'package:balhom/src/features/home/presentation/views/home_tabs.dart';
import 'package:balhom/src/features/home/presentation/views/home_view.dart';
import 'package:balhom/src/features/settings/presentation/views/settings_view.dart';
import 'package:balhom/src/features/statistics/presentation/views/statistics_view.dart';
import 'package:balhom/src/features/version/presentation/views/version_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  errorBuilder: (context, state) {
    if (state.error
        .toString()
        .contains("/${AppErrorView.noConnectionErrorPath}")) {
      return const AppErrorView(
          location: "/${AppErrorView.noConnectionErrorPath}");
    }
    return const AppErrorView(location: "/${AppErrorView.notFoundPath}");
  },
  navigatorKey: navigatorKey,
  debugLogDiagnostics: true,
  refreshListenable: authStateListenable,
  redirect: appGuard,
  observers: [routeObserver],
  routes: [
    GoRoute(
        name: 'root',
        path: '/',
        builder: (_, __) => const AppLoadingView(),
        redirect: rootGuard,
        routes: [
          GoRoute(
            name: VersionLoadingView.routeName,
            path: VersionLoadingView.routePath,
            builder: (context, state) => const VersionLoadingView(),
          ),
          GoRoute(
            name: AuthLoadingView.routeName,
            path: AuthLoadingView.routePath,
            builder: (context, state) {
              return AuthLoadingView(
                  location: state.uri.queryParameters['path'] != null
                      ? state.uri.queryParameters['path']!
                      : "/${AuthLoadingView.routePath}");
            },
          ),
          GoRoute(
            name: AuthView.routeName,
            path: AuthView.routePath,
            redirect: authGuard,
            builder: (context, state) => AuthView(),
          ),
          GoRoute(
            name: LogoutView.routeName,
            path: LogoutView.routePath,
            redirect: logoutGuard,
            builder: (context, state) => const LogoutView(),
          ),
          GoRoute(
            name: AccountEditView.routeName,
            path: AccountEditView.routePath,
            redirect: authGuardOrNone,
            builder: (context, state) => AccountEditView(),
          ),
          GoRoute(
            name: AccountDeleteView.routeName,
            path: AccountDeleteView.routePath,
            redirect: authGuardOrNone,
            builder: (context, state) => const AccountDeleteView(),
          ),
          GoRoute(
            name: SettingsView.routeName,
            path: SettingsView.routePath,
            redirect: authGuardOrNone,
            builder: (context, state) => SettingsView(),
          ),
          GoRoute(
            name: StatisticsView.routeName,
            path: StatisticsView.routePath,
            redirect: authGuardOrNone,
            pageBuilder: (context, state) => FadeTransitionView(
                key: _homeScaffoldKey,
                child: const HomeView(
                    selectedSection: HomeTabEnum.statistics,
                    child: Center(child: StatisticsView()))),
          ),
          GoRoute(
              name: BalanceView.routeRevenueName,
              path: BalanceView.routeRevenuePath,
              redirect: authGuardOrNone,
              pageBuilder: (context, state) => FadeTransitionView(
                  key: _homeScaffoldKey,
                  child: const HomeView(
                      selectedSection: HomeTabEnum.revenues,
                      child: BalanceView(
                        balanceTypeEnum: BalanceTypeEnum.revenue,
                      ))),
              routes: [
                GoRoute(
                    name: BalanceView.routeRevenueName +
                        BalanceCreateView.routeName,
                    path: BalanceCreateView.routePath,
                    builder: (context, state) => const BalanceCreateView(
                          balanceTypeEnum: BalanceTypeEnum.revenue,
                        )),
                GoRoute(
                    name: BalanceView.routeRevenueName +
                        BalanceEditView.routeName,
                    path: BalanceEditView.routePath,
                    builder: (context, state) => BalanceEditView(
                          id: int.parse(GoRouterState.of(context)
                              .uri
                              .queryParameters['id']!),
                          balanceTypeEnum: BalanceTypeEnum.revenue,
                        )),
              ]),
          GoRoute(
              name: BalanceView.routeExpenseName,
              path: BalanceView.routeExpensePath,
              redirect: authGuardOrNone,
              pageBuilder: (context, state) => FadeTransitionView(
                  key: _homeScaffoldKey,
                  child: const HomeView(
                      selectedSection: HomeTabEnum.expenses,
                      child: BalanceView(
                        balanceTypeEnum: BalanceTypeEnum.expense,
                      ))),
              routes: [
                GoRoute(
                    name: BalanceView.routeExpenseName +
                        BalanceCreateView.routeName,
                    path: BalanceCreateView.routePath,
                    builder: (context, state) => const BalanceCreateView(
                          balanceTypeEnum: BalanceTypeEnum.expense,
                        )),
                GoRoute(
                    name: BalanceView.routeExpenseName +
                        BalanceEditView.routeName,
                    path: BalanceEditView.routePath,
                    builder: (context, state) => BalanceEditView(
                          id: int.parse(GoRouterState.of(context)
                              .uri
                              .queryParameters['id']!),
                          balanceTypeEnum: BalanceTypeEnum.expense,
                        )),
              ]),
          GoRoute(
            name: AppLoadingView.routeName,
            path: AppLoadingView.routePath,
            builder: (context, state) => const AppLoadingView(),
          ),
        ]),
  ],
);

final navigatorKey = GlobalKey<NavigatorState>();

const ValueKey<String> _homeScaffoldKey = ValueKey<String>('balhom_home');

/// Route observer to use with RouteAware
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

String? appGuard(BuildContext context, GoRouterState state) {
  return null;
}

String? rootGuard(BuildContext context, GoRouterState state) {
  final goingRoot = state.uri.toString() == '/';
  if (goingRoot) {
    return "/${VersionLoadingView.routePath}";
  }
  return null;
}

Future<String?> logoutGuard(BuildContext context, GoRouterState state) async {
  final loggedIn = authStateListenable.value;
  final goingToLogout = state.uri.toString() == '/${LogoutView.routePath}';
  if (!loggedIn && goingToLogout) {
    return "/";
  }
  return null;
}

Future<String?> authGuard(BuildContext context, GoRouterState state) async {
  final loggedIn = authStateListenable.value;
  if (loggedIn) {
    return "/${StatisticsView.routePath}";
  } else if (state.extra == null || state.extra != true) {
    return "/${AuthLoadingView.routePath}?path=/${AuthView.routePath}";
  }
  return null;
}

Future<String?> authGuardOrNone(
    BuildContext context, GoRouterState state) async {
  final loggedIn = authStateListenable.value;
  final isConnected = connectionStateListenable.value;
  if (!isConnected &&
      (state.name == SettingsView.routeName ||
          state.name == BalanceCreateView.routeName ||
          state.name == AccountDeleteView.routeName ||
          state.name == LogoutView.routeName)) {
    return "/${AppErrorView.noConnectionErrorPath}";
  }
  if (!loggedIn) {
    return "/${AuthLoadingView.routePath}?path=${state.uri.toString()}";
  }
  return null;
}

Future<String?> passwordGuard(BuildContext context, GoRouterState state) async {
  final isConnected = connectionStateListenable.value;
  if (!isConnected) {
    return "/${AppErrorView.noConnectionErrorPath}";
  }
  final goingToPassword =
      GoRouterState.of(context).uri.toString() == '/password';
  if (goingToPassword) return "/";
  return null;
}
