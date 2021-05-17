import 'package:flutter/material.dart';

mixin NumUtils {
  double getMaxWidth(
    BuildContext context,
    double maxPercentageWidth,
    double maxNumericalWidth,
  ) {
    final width = MediaQuery.of(context).size.width;
    final double calculatedMaxPercentageWidth = width * maxPercentageWidth;
    return maxPercentageWidth < maxNumericalWidth ? calculatedMaxPercentageWidth : maxNumericalWidth;
  }
}
