import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

final lastExitPressState = ValueNotifier<DateTime?>(null);

class AppPopScope extends StatelessWidget {
  final Widget child;
  final String? snackBarText;

  const AppPopScope({super.key, required this.child, this.snackBarText});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        final now = DateTime.now();
        if (lastExitPressState.value != null &&
            now.difference(lastExitPressState.value!) <
                const Duration(seconds: 2)) {
          exit(0);
        } else {
          lastExitPressState.value = now;
          if (snackBarText != null) {
            final snackBar = SnackBar(
                content: Text(snackBarText!, textAlign: TextAlign.center),
                duration: const Duration(seconds: 2));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }
      },
      child: child,
    );
  }
}
