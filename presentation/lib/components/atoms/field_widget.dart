import 'package:flutter/material.dart';
import 'package:presentation/design/design.dart';

class FieldWidget extends StatelessWidget {
  final String hintText;
  final Function onChanged;
  final TextEditingController? controller;

  const FieldWidget({
    required this.hintText,
    required this.onChanged,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double maxPercentageWidth = width * 0.85;
    const double maxNominalWidth = 400;
    return Container(
      constraints: BoxConstraints(
        minWidth: 200,
        maxWidth: maxPercentageWidth < maxNominalWidth ? maxPercentageWidth : maxNominalWidth,
      ),
      child: TextFormField(
        style: Fonts.fieldText,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey3)),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey2, width: 2)),
          hintText: hintText,
          hintStyle: Fonts.hint,
        ),
      ),
    );
  }
}
