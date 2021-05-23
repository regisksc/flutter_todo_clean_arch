import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../presentation.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Platform.isIOS
      ? CupertinoTheme(
          data: CupertinoTheme.of(context).copyWith(brightness: Brightness.dark),
          child: const CupertinoActivityIndicator(),
        )
      : const CircularProgressIndicator(backgroundColor: AppColors.white);
}
