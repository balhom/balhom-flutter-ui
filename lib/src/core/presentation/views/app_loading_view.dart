import 'package:balhom/src/core/presentation/views/app_scaffold.dart';
import 'package:balhom/src/core/presentation/widgets/app_loading_widget.dart';
import 'package:flutter/material.dart';

class AppLoadingView extends StatelessWidget {
  /// Named route for [AppLoadingView]
  static const String routeName = 'loading';

  /// Path route for [AppLoadingView]
  static const String routePath = 'load';

  final void Function(BuildContext context)? func;
  const AppLoadingView({
    this.func,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    if (func != null) func!(context);
    return const AppScaffold(
      body: AppLoadingWidget()
    );
  }
}