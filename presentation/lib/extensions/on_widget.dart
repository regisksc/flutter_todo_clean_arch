import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget withNotchAvoider(BuildContext context) => Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: this,
        ),
      );

  Widget get center => Align(alignment: const Alignment(0, 0), child: this);
  Widget get left => Align(alignment: const Alignment(-1, 0), child: this);
  Widget get right => Align(alignment: const Alignment(1, 0), child: this);
}
