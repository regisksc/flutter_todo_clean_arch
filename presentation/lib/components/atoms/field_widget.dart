import 'package:flutter/material.dart';
import '../../presentation.dart';

class FieldWidget extends StatelessWidget with NumUtils {
  const FieldWidget({
    required this.hintText,
    required this.onChanged,
    this.controller,
    this.obscureField = false,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final Function onChanged;
  final TextEditingController? controller;
  final bool obscureField;

  @override
  Widget build(BuildContext context) => Container(
        height: WidgetConsts.fieldHeight,
        constraints: BoxConstraints(
          minWidth: 200,
          maxWidth: getMaxWidth(context, 0.85, 400),
        ),
        child: TextFormField(
          style: Fonts.fieldText,
          cursorColor: AppColors.grey2,
          obscureText: obscureField,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey3)),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey2, width: 2)),
            hintText: hintText,
            hintStyle: Fonts.hint,
          ),
        ),
      );
}
