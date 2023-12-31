import 'package:balhom/config/app_layout.dart';
import 'package:balhom/src/core/utils/type_util.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_type_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceTypeDropdownPicker extends StatefulWidget {
  final String name;
  final List<BalanceTypeEntity> items;
  final bool readOnly;
  final void Function(BalanceTypeEntity?)? onChanged;
  final AppLocalizations appLocalizations;
  final ValueNotifier<BalanceTypeEntity> balanceTypeState;

  BalanceTypeDropdownPicker(
      {required this.name,
      required BalanceTypeEntity initialValue,
      required this.items,
      required this.appLocalizations,
      this.readOnly = false,
      this.onChanged,
      super.key})
      : balanceTypeState = ValueNotifier<BalanceTypeEntity>(initialValue);

  @override
  State<BalanceTypeDropdownPicker> createState() =>
      _BalanceTypeDropdownPickerState();
}

class _BalanceTypeDropdownPickerState extends State<BalanceTypeDropdownPicker> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 20),
        width: 280,
        decoration: BoxDecoration(
            color: appTheme.colorScheme.background,
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(
                Radius.circular(AppLayout.containerBorderRadius))),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
            child: Text(
              widget.name,
              style: GoogleFonts.openSans(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 15),
            ),
          ),
          DropdownButton<String>(
            value: widget.balanceTypeState.value.name,
            onChanged: widget.readOnly
                ? null
                : (String? name) {
                    for (final value in widget.items) {
                      if (value.name == name) {
                        if (widget.onChanged != null) {
                          widget.onChanged!(value);
                        }
                        setState(() {
                          widget.balanceTypeState.value = value;
                        });
                        return;
                      }
                    }
                  },
            items: widget.items
                .map<DropdownMenuItem<String>>((BalanceTypeEntity value) {
              return DropdownMenuItem<String>(
                value: value.name,
                child: Row(
                  children: [
                    Image.network(
                      value.image,
                      width: 24,
                      height: 24,
                    ),
                    horizontalSpace(),
                    Text(
                      TypeUtil.balanceTypeToString(
                          value.name, widget.appLocalizations),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }
}
