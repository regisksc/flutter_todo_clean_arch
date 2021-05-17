import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'design.dart';

abstract class Fonts {
  static final rubik = GoogleFonts.rubik(letterSpacing: 0.3);
  static final openSans = GoogleFonts.openSans(letterSpacing: 0.3);

  static final headline1 = rubik.copyWith(color: AppColors.purple1, fontSize: 22, fontWeight: FontWeight.w600);
  static final headline2 = headline1.copyWith(fontSize: 14);
  static final headline3 = rubik.copyWith(color: AppColors.white, fontSize: 12);
  static final hint = rubik.copyWith(color: AppColors.grey3, fontSize: 20, fontWeight: FontWeight.w400);
  static final fieldText = rubik.copyWith(color: AppColors.grey2, fontSize: 20, fontWeight: FontWeight.bold);
  static final button =
      rubik.copyWith(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 0.9);
  static final time = rubik.copyWith(color: AppColors.grey5, fontSize: 11);
  static final footer = openSans.copyWith(color: AppColors.blueGrey, fontSize: 18);
}
