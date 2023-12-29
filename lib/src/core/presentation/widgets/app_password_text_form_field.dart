import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppPasswordTextFormField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final Color? textColor;
  final double? maxWidth;
  final double? maxHeight;
  final double? fontSize;
  final int? maxCharacters;
  final bool readOnly;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? Function(String?)? validator;

  const AppPasswordTextFormField(
      {required this.title,
      required this.controller,
      this.textColor,
      this.maxWidth,
      this.maxHeight,
      this.onChanged,
      this.onTap,
      this.validator,
      this.fontSize = 14,
      this.maxCharacters,
      this.readOnly = false,
      super.key});

  @override
  State<AppPasswordTextFormField> createState() =>
      _AppPasswordTextFormFieldState();
}

class _AppPasswordTextFormFieldState extends State<AppPasswordTextFormField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
                maxHeight: widget.maxHeight ?? double.infinity,
                maxWidth: widget.maxWidth ?? 700),
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              obscureText: !showPassword,
              readOnly: widget.readOnly,
              textAlign: TextAlign.start,
              maxLength: widget.maxCharacters,
              onChanged: widget.readOnly ? null : widget.onChanged,
              onTap: widget.readOnly ? null : widget.onTap,
              controller: widget.controller,
              validator: widget.validator,
              style: widget.textColor != null
                  ? GoogleFonts.openSans(color: widget.textColor)
                  : null,
              decoration: InputDecoration(
                counterText: '',
                labelText: widget.title,
                errorStyle: widget.fontSize != null
                    ? GoogleFonts.openSans(fontSize: widget.fontSize)
                    : null,
                labelStyle: widget.textColor != null
                    ? GoogleFonts.openSans(color: widget.textColor)
                    : null,
                hintStyle: widget.textColor != null
                    ? GoogleFonts.openSans(color: widget.textColor)
                    : null,
                filled: true,
                fillColor: widget.readOnly
                    ? const Color.fromARGB(108, 167, 167, 167)
                    : null,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  focusNode: FocusNode(skipTraversal: true),
                  child: (showPassword)
                      ? Icon(Icons.visibility, color: widget.textColor)
                      : Icon(Icons.visibility_off, color: widget.textColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
