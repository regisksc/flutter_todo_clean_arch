import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget withNotchAvoider(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        child: this,
      ),
    );
  }
}
