import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: Color(0XFFE0F2F1),
  100: Color(0XFFB2DFDB),
  200: Color(0XFF80CBC4),
  300: Color(0XFF4DB6AC),
  400: Color(0XFF26A69A),
  500: Color(0XFF009688),
  600: Color(0XFF00897B),
  700: Color(0XFF00796B),
  800: Color(0XFF00695C),
  900: Color(0XFF005354),
};

const PrimaryColor = const Color(0xFF008080);
const PrimaryColorLight = const Color(0xFF4cb0af);
const PrimaryColorDark = const Color(0xFF005354);

const SecondaryColor = const Color(0xFFb2dfdb);
const SecondaryColorLight = const Color(0xFFe5ffff);
const SecondaryColorDark = const Color(0xFF82ada9);

const Background = const Color(0xFFfffdf7);
const DarkBackground = const Color(0xFF222727);

const TextColor = const Color(0xFF004d40);

class MyTheme {
  static final ThemeData defaultTheme = _buildLightTheme();
  static final ThemeData darkTheme = _buildDarkTheme();

  static ThemeData _buildLightTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(0xFFF005354, color),
        primaryColorDark: PrimaryColorDark,
        accentColor: SecondaryColor,
        cardColor: Background,
        backgroundColor: Background,
        errorColor: Colors.red[700],
        brightness: Brightness.light,
      ),
      inputDecorationTheme: InputDecorationTheme(
          iconColor: PrimaryColorDark,
          labelStyle: TextStyle(color: PrimaryColorDark)),
      primaryColorLight: PrimaryColorLight,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: PrimaryColorLight,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              fixedSize: Size(100, 50))),
      appBarTheme: AppBarTheme(color: PrimaryColorDark),
      scaffoldBackgroundColor: Background,
      textSelectionTheme:
          TextSelectionThemeData(selectionColor: PrimaryColorLight),
      textTheme: base.textTheme.copyWith(
        bodyText1: base.textTheme.bodyText1?.copyWith(color: TextColor),
        bodyText2: base.textTheme.bodyText2?.copyWith(color: TextColor),
      ),
    );
  }

  static ThemeData _buildDarkTheme() {
    final ThemeData base = ThemeData.dark();

    return base.copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(0xFFF005354, color),
        primaryColorDark: PrimaryColorDark,
        accentColor: SecondaryColor,
        cardColor: DarkBackground,
        backgroundColor: DarkBackground,
        errorColor: Colors.red[700],
        brightness: Brightness.dark,
      ),
      primaryColor: PrimaryColor,
      primaryColorLight: PrimaryColorLight,
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: PrimaryColorDark),
          iconColor: PrimaryColorDark,
          labelStyle: TextStyle(color: PrimaryColorDark)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: PrimaryColorLight,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              fixedSize: Size(100, 50))),
      scaffoldBackgroundColor: DarkBackground,
      appBarTheme: AppBarTheme(color: PrimaryColorDark),
      cardColor: DarkBackground,
      textSelectionTheme:
          TextSelectionThemeData(selectionColor: PrimaryColorLight),
      backgroundColor: DarkBackground,
      textTheme: base.textTheme.copyWith(
        bodyText1: base.textTheme.bodyText1?.copyWith(color: TextColor),
        bodyText2: base.textTheme.bodyText2?.copyWith(color: TextColor),
      ),
    );
  }
}
