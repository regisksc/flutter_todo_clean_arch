import 'package:flutter/material.dart';

import '../../presentation.dart';

class ButtonWidget extends StatelessWidget with NumUtils {
  final String label;
  final Function() onTap;

  const ButtonWidget({
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(5);
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(10),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
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
