import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData makeAppTheme() {
  final primaryColor = Color(0xff5F87E7);
  final primaryColorDark = primaryColor;
  final primaryColorLight = primaryColor;
  final secondaryColor = Color(0xff7EB6FF);
  final secondaryColorDark = secondaryColor;
  final disabledColor = Colors.grey[400];
  final dividerColor = Colors.grey;
  final textTheme = TextTheme(
    headline1: GoogleFonts.rubik(color: primaryColor, fontSize: 14, fontWeight: FontWeight.w500),
  );
  final inputDecorationTheme = InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryColorLight)),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
    alignLabelWithHint: true,
  );
  final buttonTheme = ButtonThemeData(
    colorScheme: ColorScheme.light(primary: primaryColor),
    buttonColor: primaryColor,
    splashColor: primaryColorLight,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );

  return ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    highlightColor: secondaryColor,
    secondaryHeaderColor: secondaryColorDark,
    disabledColor: disabledColor,
    dividerColor: dividerColor,
    accentColor: primaryColor,
    backgroundColor: Colors.white,
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme,
    buttonTheme: buttonTheme,
  );
}
