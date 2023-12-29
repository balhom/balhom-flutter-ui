import 'package:flutter/material.dart';

/// Application color constants.
class AppColors {
  /// Primary color of the app.
  static MaterialColor primaryColor =
      colorToMaterialColor(const Color.fromARGB(255, 236, 222, 185));

  static const Color appLightBackgroundColor = Colors.white;

  static const Color appDarkBackgroundColor = AppColors.greyColor;

  static const Color appBarBackgroundColor = Color.fromARGB(255, 43, 43, 43);

  static const Color circularProgressColor = Colors.green;

  static const Color circularProgressErrorColor = Colors.red;

  static const Color balanceBackgroundColor =
      Color.fromARGB(254, 254, 252, 224);

  static const Color balanceDarkBackgroundColor =
      Color.fromARGB(251, 148, 147, 135);

  static const Color revenueBackgroundLightColor =
      Color.fromARGB(255, 223, 237, 214);

  static const Color revenueBackgroundDarkColor =
      Color.fromARGB(255, 80, 110, 64);

  static const Color expenseBackgroundLightColor =
      Color.fromARGB(255, 255, 236, 215);

  static const Color expenseBackgroundDarkColor =
      Color.fromARGB(255, 182, 125, 108);

  static const Color indicatorColor = Color.fromARGB(255, 7, 136, 76);

  static const Color greyColor = Color.fromARGB(255, 119, 119, 119);

  static MaterialColor colorToMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;
    final int alpha = color.alpha;
    final Map<int, Color> shades = {
      50: Color.fromARGB(alpha, red, green, blue),
      100: Color.fromARGB(alpha, red, green, blue),
      200: Color.fromARGB(alpha, red, green, blue),
      300: Color.fromARGB(alpha, red, green, blue),
      400: Color.fromARGB(alpha, red, green, blue),
      500: Color.fromARGB(alpha, red, green, blue),
      600: Color.fromARGB(alpha, red, green, blue),
      700: Color.fromARGB(alpha, red, green, blue),
      800: Color.fromARGB(alpha, red, green, blue),
      900: Color.fromARGB(alpha, red, green, blue),
    };
    return MaterialColor(color.value, shades);
  }
}
