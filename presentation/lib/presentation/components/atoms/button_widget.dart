import 'package:flutter/material.dart';

import '../../../presentation.dart';

class ButtonWidget extends StatelessWidget with NumUtils {
  const ButtonWidget({
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(5);
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        onPrimary: AppColors.primaryBlueLight,
        elevation: 10,
        padding: EdgeInsets.zero,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          height: 55,
          width: getMaxWidth(context, 0.8, 380),
          decoration: const BoxDecoration(gradient: AppColors.buttonGradient),
          alignment: Alignment.center,
          child: Text(label, style: Fonts.button),
        ),
      ),
    );
  }
}
