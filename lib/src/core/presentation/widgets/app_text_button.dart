import 'package:balhom/config/app_layout.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final double? borderRadius;
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
      this.borderRadius,
      this.enabled = true,
      this.loading = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

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
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    borderRadius ?? AppLayout.buttonBorderRadius))));
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: (!enabled) ? null : onPressed,
        style: style,
        child: loading
            ? const CircularProgressIndicator()
            : Text(text,
                textAlign: TextAlign.center,
                style: appTheme.textTheme.bodyMedium!
                    .copyWith(fontSize: fontSize, color: textColor)),
      ),
    );
  }
}
