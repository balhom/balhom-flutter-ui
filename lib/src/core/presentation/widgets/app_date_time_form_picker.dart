import 'package:balhom/src/core/presentation/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class AppDateTimeFormPicker extends StatelessWidget {
  final String title;
  final Function(DateTime) onTap;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final double maxWidth;
  final bool readOnly;

  const AppDateTimeFormPicker(
      {super.key,
      required this.onTap,
      required this.controller,
      required this.title,
      required this.validator,
      required this.maxWidth,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      onTap: () async {
        // Below line stops keyboard from appearing
        FocusScope.of(context).requestFocus(FocusNode());
        // Show Date Picker
        final DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now());
        if (newDate != null) {
          // Show Time Picker
          // ignore: use_build_context_synchronously
          final TimeOfDay? newTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(DateTime.now()),
          );

          if (newTime != null) {
            onTap(newDate);
          }
        }
      },
      textAlign: TextAlign.center,
      controller: controller,
      title: title,
      validator: validator,
      maxWidth: maxWidth,
      readOnly: readOnly,
    );
  }
}
