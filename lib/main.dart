import 'package:balhom/src/app.dart';
import 'package:balhom/src/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  runApp(
    UncontrolledProviderScope(
      container: await bootstrap(),
      child: const BalHomApp()
    )
  );
}
