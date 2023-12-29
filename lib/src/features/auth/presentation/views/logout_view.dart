import 'package:balhom/src/core/presentation/views/app_loading_view.dart';
import 'package:balhom/src/core/router.dart';
import 'package:balhom/src/core/presentation/views/app_error_view.dart';
import 'package:balhom/src/features/auth/presentation/views/auth_view.dart';
import 'package:balhom/src/features/auth/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogoutView extends ConsumerWidget {
  /// Named route for [LogoutView]
  static const String routeName = 'logout';

  /// Path route for [LogoutView]
  static const String routePath = 'logout';

  const LogoutView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logoutUseCase = ref.read(logoutUseCaseProvider.notifier);
    Future.delayed(Duration.zero, () async {
      await logoutUseCase.handle();
      final logoutState = ref.read(logoutUseCaseProvider);
      if (logoutState.hasError) {
        AppErrorView.go();
      } else {
        router.goNamed(AuthView.routeName);
      }
    });
    return const AppLoadingView();
  }
}
