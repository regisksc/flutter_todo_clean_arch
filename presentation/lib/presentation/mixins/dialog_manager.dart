import 'dart:async';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

import '../../presentation.dart';

mixin DialogManager {
  Future? showDialogWithText(BuildContext context, String message) {
    final completer = Completer();
    context.showFlashDialog(content: _content(context, message), dismissCompleter: completer);
    Future.delayed(const Duration(milliseconds: 2500), () => completer.complete());
  }
}

Widget _content(BuildContext context, String message) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Container(
    padding: EdgeInsets.symmetric(vertical: height * 0.03),
    child: Text(
      message,
      textAlign: TextAlign.center,
      style: Fonts.headline2.copyWith(color: AppColors.error),
    ),
  );
}
