import 'package:balhom/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Default [ThemeData]
class AppTheme {
  @visibleForTesting
  static NavigationRailThemeData navigationRailTheme =
      const NavigationRailThemeData(
          selectedIconTheme: IconThemeData(color: Colors.white),
          unselectedIconTheme: IconThemeData(color: Colors.white54),
          backgroundColor: Color.fromARGB(255, 70, 70, 70));

  @visibleForTesting
  static BottomNavigationBarThemeData bottomNavigationBarTheme =
      const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          backgroundColor: Color.fromARGB(255, 70, 70, 70));

  /// Light [ThemeData]
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      primaryColor: AppColors.primaryColor,
      navigationRailTheme: navigationRailTheme,
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      primaryTextTheme: GoogleFonts.openSansTextTheme().apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
        decorationColor: Colors.black,
      ),
      // Text widget theme
      textTheme: GoogleFonts.openSansTextTheme().apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
        decorationColor: Colors.black,
      ),
      // Text field widget theme
      inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          errorStyle: GoogleFonts.openSans(fontSize: 14),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.indicatorColor),
          ),
          hintStyle: GoogleFonts.openSans(color: Colors.black),
          labelStyle: GoogleFonts.openSans(color: Colors.black),
          filled: true,
          fillColor: Colors.white),
      // Elevated button widget theme
      elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          const backColor = Colors.white;
          if (states.contains(MaterialState.pressed) ||
              states.contains(MaterialState.disabled)) {
            return backColor.withOpacity(0.6);
          }
          return backColor;
        }),
      )),
      // Icon widget theme
      iconTheme: const IconThemeData(color: Colors.black),
      // Default color scheme theme
      colorScheme: ColorScheme.fromSwatch(
              brightness: Brightness.light,
              primarySwatch: AppColors.primaryColor)
          .copyWith(background: AppColors.appLightBackgroundColor));

  /// Dark [ThemeData]
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      primaryColor: AppColors.primaryColor,
      navigationRailTheme: navigationRailTheme,
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      primaryTextTheme: GoogleFonts.openSansTextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
        decorationColor: Colors.white,
      ),
      // Text widget theme
      textTheme: GoogleFonts.openSansTextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
        decorationColor: Colors.white,
      ),
      // Text field widget theme
      inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          errorStyle: GoogleFonts.openSans(fontSize: 14),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.indicatorColor),
          ),
          hintStyle: GoogleFonts.openSans(color: Colors.white),
          labelStyle: GoogleFonts.openSans(color: Colors.white),
          filled: true,
          fillColor: AppColors.greyColor),
      // Elevated button widget theme
      elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          const backColor = AppColors.greyColor;
          if (states.contains(MaterialState.pressed) ||
              states.contains(MaterialState.disabled)) {
            return backColor.withOpacity(0.6);
          }
          return backColor;
        }),
      )),
      // Icon widget theme
      iconTheme: const IconThemeData(color: Colors.white),
      // Default color scheme theme
      colorScheme: ColorScheme.fromSwatch(
              primarySwatch: AppColors.colorToMaterialColor(Colors.white))
          .copyWith(
              brightness: Brightness.dark,
              background: AppColors.appDarkBackgroundColor));
}
