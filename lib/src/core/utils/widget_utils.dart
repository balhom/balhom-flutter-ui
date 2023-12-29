import 'package:balhom/config/app_layout.dart';
import 'package:balhom/src/core/presentation/widgets/app_error_widget.dart';
import 'package:balhom/src/core/presentation/widgets/app_loading_widget.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:flutter/material.dart';

Widget showLoading(
    {Widget? background,
    AlignmentGeometry alignment = AlignmentDirectional.centerStart}) {
  return Stack(alignment: alignment, children: [
    IgnorePointer(child: background),
    const AppLoadingWidget(color: Colors.grey),
  ]);
}

Widget showError(
    {Object? error, Widget? background, String? text, IconData? icon}) {
  if (error != null) debugPrint("[ERROR] $error");
  return Stack(alignment: AlignmentDirectional.centerStart, children: [
    IgnorePointer(child: background),
    AppErrorWidget(
        text: text,
        icon: icon ??
            (!connectionStateListenable.value
                ? Icons.network_wifi_1_bar
                : icon)),
  ]);
}

Widget verticalSpace() {
  return const SizedBox(
    height: AppLayout.genericPadding,
  );
}

Widget horizontalSpace() {
  return const SizedBox(
    width: AppLayout.genericPadding,
  );
}
