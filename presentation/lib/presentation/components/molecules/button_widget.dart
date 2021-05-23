import 'package:flutter/material.dart';

import '../../../presentation.dart';

class ButtonWidget extends StatelessWidget with NumUtils {
  const ButtonWidget({
    required this.label,
    required this.onTap,
    this.displayLoading = false,
    this.enable = true,
    Key? key,
  }) : super(key: key);
  final String label;
  final bool displayLoading;
  final bool enable;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(5);
    const double buttonHeight = 55;
    return Theme(
      data: Theme.of(context).copyWith(),
      child: ElevatedButton(
        onPressed: enable ? onTap : () {},
        style: ElevatedButton.styleFrom(
          onPrimary: AppColors.primaryBlueLight,
          elevation: 10,
          padding: EdgeInsets.zero,
          primary: Colors.transparent,
          shadowColor: displayLoading ? Colors.black38 : Colors.black87,
        ),
        child: AnimatedContainer(
          height: buttonHeight,
          width: displayLoading ? buttonHeight : getMaxWidth(context, maxPercentageWidth: 0.8, maxNumericalWidth: 380),
          decoration: BoxDecoration(
            borderRadius: displayLoading ? borderRadius * 5 : borderRadius,
            gradient: enable ? AppColors.enabledButtonGradient : AppColors.disabledButtonGradient,
          ),
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 500),
          child: displayLoading ? Loader() : Text(label, style: Fonts.button),
        ),
      ),
    );
  }
}
