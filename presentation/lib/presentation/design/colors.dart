import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppColors {
  AppColors._();
  static const primaryBlue = Color(0xff5F87E7);
  static const primaryBlueLight = Color(0xff7EB6FF);
  static const secondaryBlue = Color(0xff3867D5);
  static const secondaryBlueLight = Color(0xff81C7F5);
  static const white = Color(0xffffffff);
  static const grey1 = Color(0xff404040);
  static const grey2 = Color(0xff373737);
  static const grey3 = Color(0xffACABAB);
  static const grey4 = Color(0xffCFCFCF);
  static const grey5 = Color(0xffc6c6c8);
  static const blueGrey = Color(0xff82A0B7);
  static const purple1 = Color(0xff554E8F);
  static const purple2 = Color(0xff8B87B3);
  static const error = Color(0xffEF5350); // Colors.redAccent.shade400

  static const enabledButtonGradient = LinearGradient(colors: [primaryBlue, primaryBlueLight]);
  static const disabledButtonGradient =
      LinearGradient(colors: [grey3, grey4], begin: Alignment.topLeft, end: Alignment.bottomRight);
  static const appBarGradient = LinearGradient(colors: [secondaryBlue, secondaryBlueLight]);
}
