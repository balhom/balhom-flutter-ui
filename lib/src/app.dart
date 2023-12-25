import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BalHomApp extends ConsumerStatefulWidget {
  const BalHomApp({super.key});

  @override
  BalanceHomeAppState createState() => BalanceHomeAppState();
}

class BalanceHomeAppState extends ConsumerState<BalHomApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ref.watch(themeDataProvider),
        onGenerateTitle: (context) {
          // In the app build, the context does not contain an AppLocalizations instance.
          // However, at the moment the title is ggoing to be generated
          // the AppLocalizations instance is not null
          final appLocalizations = ref.read(appLocalizationsProvider);
          return appLocalizations.appTitle;
        },
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
        backButtonDispatcher: router.backButtonDispatcher);
  }
}
