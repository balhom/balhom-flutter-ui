import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final Color? textColor;
  final double? maxWidth;
  final double? maxHeight;
  final double? fontSize;
  final int? maxCharacters;
  final bool readOnly;
  final int? minLines;
  final int? maxLines;
  final bool multiLine;
  final bool showCounterText;
  final TextAlign? textAlign;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? Function(String?)? validator;

  const AppTextFormField(
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
      this.minLines,
      this.maxLines = 1,
      this.multiLine = false,
      this.showCounterText = false,
      this.textAlign,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
                maxHeight: maxHeight ?? double.infinity,
                maxWidth: maxWidth ?? 700),
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              keyboardType: multiLine ? TextInputType.multiline : null,
              minLines: minLines,
              maxLines: maxLines,
              readOnly: readOnly,
              textAlign: textAlign ?? TextAlign.start,
              maxLength: maxCharacters,
              onChanged: readOnly ? null : onChanged,
              onTap: readOnly ? null : onTap,
              controller: controller,
              validator: validator,
              style: textColor != null
                  ? GoogleFonts.openSans(color: textColor)
                  : null,
              decoration: InputDecoration(
                counterText: showCounterText ? null : '',
                labelText: title,
                errorStyle: fontSize != null
                    ? GoogleFonts.openSans(fontSize: fontSize)
                    : null,
                labelStyle: textColor != null
                    ? GoogleFonts.openSans(color: textColor)
                    : null,
                hintStyle: textColor != null
                    ? GoogleFonts.openSans(color: textColor)
                    : null,
                filled: true,
                fillColor:
                    readOnly ? const Color.fromARGB(108, 167, 167, 167) : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
