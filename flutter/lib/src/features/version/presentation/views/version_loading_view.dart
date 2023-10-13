import 'package:balance_home_app/config/app_colors.dart';
import 'package:balance_home_app/src/core/domain/failures/http/http_connection_failure.dart';
import 'package:balance_home_app/src/core/router.dart';
import 'package:balance_home_app/src/core/presentation/widgets/app_loading_widget.dart';
import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/core/utils/widget_utils.dart';
import 'package:balance_home_app/src/features/auth/presentation/views/auth_view.dart';
import 'package:balance_home_app/src/features/version/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VersionLoadingView extends ConsumerStatefulWidget {
  /// Named route for [VersionLoadingView]
  static const String routeName = 'versionLoadingView';

  /// Path route for [VersionLoadingView]
  static const String routePath = 'app-version';

  const VersionLoadingView({super.key});

  @override
  ConsumerState<VersionLoadingView> createState() => _VersionLoadingViewState();
}

class _VersionLoadingViewState extends ConsumerState<VersionLoadingView> {
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    return Scaffold(
        body: ref.watch(versionController).when<Widget>(
            data: (final failureOrAppVersion) {
      return failureOrAppVersion.fold((failure) {
        if (failure is HttpConnectionFailure) {
          Future.delayed(Duration.zero, () {
            router.goNamed(AuthView.routeName);
          });
          return showLoading();
        }
        return showError(
            icon: Icons.network_wifi_1_bar,
            text: appLocalizations.genericError);
      }, (appVersion) {
        if (appVersion.isLower != null && !appVersion.isLower!) {
          Future.delayed(Duration.zero, () {
            router.goNamed(AuthView.routeName);
          });
          return AppLoadingWidget(
            color: AppColors.circularProgressColor,
            text: "${appLocalizations.version} "
                "${appVersion.x}.${appVersion.y}.${appVersion.z}",
          );
        }
        return showError(
            icon: Icons.network_wifi_1_bar,
            text: appLocalizations.wrongVersion);
      });
    }, error: (error, _) {
      return showError(error: error, text: appLocalizations.genericError);
    }, loading: () {
      return showLoading();
    }));
  }
}