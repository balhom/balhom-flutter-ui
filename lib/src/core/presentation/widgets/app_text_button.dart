import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final bool enabled;
  final bool loading;

  const AppTextButton(
      {required this.text,
      required this.onPressed,
      this.fontSize,
      this.backgroundColor,
      this.textColor,
      this.foregroundColor,
      this.width,
      this.height,
      this.enabled = true,
      this.loading = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ButtonStyle(
      backgroundColor: backgroundColor != null
          ? MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed) ||
                  states.contains(MaterialState.disabled)) {
                return backgroundColor!.withOpacity(0.6);
              }
              return backgroundColor!;
            })
          : null,
      foregroundColor: (foregroundColor == null)
          ? null
          : MaterialStateProperty.all<Color>(foregroundColor!),
    );
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: (!enabled) ? null : onPressed,
        style: style,
        child: loading
            ? const CircularProgressIndicator()
            : Text(
                text,
                textAlign: TextAlign.center,
                style: fontSize != null || textColor != null
                    ? GoogleFonts.openSans(fontSize: fontSize, color: textColor)
                    : null,
              ),
      ),
    );
  }
}