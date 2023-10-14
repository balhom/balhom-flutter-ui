import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

final lastExitPressState = ValueNotifier<DateTime?>(null);

class AppWillPopScope extends StatelessWidget {
  final Widget child;
  final String? snackBarText;

  const AppWillPopScope({super.key, required this.child, this.snackBarText});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
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
          return false;
        }
      },
      child: child,
    );
  }
}
