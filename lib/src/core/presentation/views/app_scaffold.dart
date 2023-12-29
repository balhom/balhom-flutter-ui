import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;

  const AppScaffold(
      {super.key, required this.body, this.appBar, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: body, appBar: appBar, backgroundColor: backgroundColor));
  }
}
