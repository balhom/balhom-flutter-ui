import 'package:balhom/config/app_layout.dart';
import 'package:flutter/material.dart';

class DropdownPickerField extends StatefulWidget {
  final String? name;
  final List<String> items;
  final bool readOnly;
  final double width;
  final void Function(String?)? onChanged;
  final valueState = ValueNotifier<String?>(null);

  DropdownPickerField(
      {required String initialValue,
      required this.items,
      this.name,
      this.readOnly = false,
      this.onChanged,
      this.width = 200,
      super.key}) {
    valueState.value = initialValue;
  }

  @override
  State<DropdownPickerField> createState() => _DropdownPickerFieldState();
}

class _DropdownPickerFieldState extends State<DropdownPickerField> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Center(
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 20),
        width: widget.width,
        decoration: BoxDecoration(
            color: appTheme.colorScheme.background,
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(
                Radius.circular(AppLayout.containerBorderRadius))),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (widget.name != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
              child: Text(
                widget.name!,
                style: appTheme.textTheme.bodyMedium!.copyWith(fontSize: 15),
              ),
            ),
          DropdownButton<String>(
            value: widget.valueState.value,
            onChanged: widget.readOnly
                ? null
                : (String? value) {
                    if (widget.onChanged != null) {
                      widget.onChanged!(value);
                    }
                    setState(() {
                      widget.valueState.value = value!;
                    });
                  },
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }
}
