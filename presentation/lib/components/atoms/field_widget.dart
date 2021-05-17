import 'package:flutter/material.dart';
import '../../presentation.dart';

class FieldWidget extends StatelessWidget with NumUtils {
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
  Widget build(BuildContext context) => Container(
        constraints: BoxConstraints(
          minWidth: 200,
          maxWidth: getMaxWidth(context, 0.85, 400),
        ),
        child: TextFormField(
          style: Fonts.fieldText,
          cursorColor: AppColors.grey2,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey3)),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey2, width: 2)),
            hintText: hintText,
            hintStyle: Fonts.hint,
          ),
        ),
      );
}
