import 'package:balhom/src/core/presentation/views/app_loading_view.dart';
import 'package:balhom/src/core/router.dart';
import 'package:balhom/src/core/presentation/views/app_error_view.dart';
import 'package:balhom/src/features/account/providers.dart';
import 'package:balhom/src/features/auth/presentation/views/auth_view.dart';
import 'package:balhom/src/features/auth/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthLoadingView extends ConsumerWidget {
  /// Named route for [AuthLoadingView]
  static const String routeName = 'authLoading';

  /// Path route for [AuthLoadingView]
  static const String routePath = 'auth-load';

  const AuthLoadingView({required this.location, super.key});

  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final silentLoginUseCase = ref.read(silentLoginUseCaseProvider.notifier);

    final accountGetUseCase = ref.read(accountGetUseCaseProvider.notifier);
    Future.delayed(Duration.zero, () async {
      await silentLoginUseCase.handle();
      final silentLoginState = ref.read(silentLoginUseCaseProvider);

      if (silentLoginState.hasError) {
        if (location == "/${AuthView.routePath}") {
          goLocation();
        } else {
          AppErrorView.go404();
        }
        return const AppLoadingView();
      } else {
        if (location != "/$routePath") {
          await accountGetUseCase.handle();
          goLocation();
          return const AppLoadingView();
        } else {
          AppErrorView.go404();
          return const AppLoadingView();
        }
      }
    });
    return const AppLoadingView();
  }

  @visibleForTesting
  void goLocation() {
    router.go(location, extra: true);
  }
}
