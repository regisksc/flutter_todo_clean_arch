import 'package:flutter/material.dart';

mixin NumUtils {
  double getMaxWidth(
    BuildContext context, {
    required double maxPercentageWidth,
    required double maxNumericalWidth,
  }) {
    assert(maxPercentageWidth >= 0 && maxPercentageWidth <= 1);
    final width = MediaQuery.of(context).size.width;
    final double calculatedMaxPercentageWidth = width * maxPercentageWidth;
    return maxPercentageWidth < maxNumericalWidth ? calculatedMaxPercentageWidth : maxNumericalWidth;
  }
}
