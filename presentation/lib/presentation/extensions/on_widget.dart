import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  // Widget responsive(BuildContext context, {double? tabletScaleFactor}) => ResponsiveWrapper.builder(
  //       ClampingScrollWrapper.builder(context, this),
  //       maxWidth: 1200,
  //       minWidth: 480,
  //       defaultScale: true,
  //       breakpoints: [
  //         const ResponsiveBreakpoint.resize(400, name: 'MOBILE'),
  //         const ResponsiveBreakpoint.resize(800, name: 'TABLET', scaleFactor: 1.1),
  //         ResponsiveBreakpoint.resize(1000, name: 'TABLET', scaleFactor: tabletScaleFactor ?? 1.5),
  //         const ResponsiveBreakpoint.autoScale(1200, name: 'TABLET'),
  //       ],
  //     );

  Widget withNotchAvoider(BuildContext context) => Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: this,
        ) /* .responsive(context) */,
      );

  Widget get center => Center(child: this);
  Widget get left => Align(alignment: const Alignment(-1, 0), child: this);
  Widget get right => Align(alignment: const Alignment(1, 0), child: this);
}
