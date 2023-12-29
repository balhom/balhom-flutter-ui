import 'package:flutter/material.dart';

class AppErrorDialog extends StatelessWidget {
  final String title;
  final String description;
  final String cancelText;
  final void Function()? onCancel;

  const AppErrorDialog({
    required this.title, 
    required this.description, 
    required this.cancelText, 
    this.onCancel,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: <Widget>[
        ElevatedButton(
          child: Text(cancelText),
          onPressed: () {
            if (onCancel != null) {
              onCancel!();
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}