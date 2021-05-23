import 'package:flutter/material.dart';
import '../../../presentation.dart';

class FieldWidget extends StatelessWidget with NumUtils {
  const FieldWidget({
    required this.hintText,
    required this.onChanged,
    this.controller,
    this.obscureField = false,
    this.hasError = false,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final Function(String) onChanged;
  final TextEditingController? controller;
  final bool obscureField;
  final bool hasError;

  @override
  Widget build(BuildContext context) => Container(
        height: WidgetConsts.fieldHeight,
        constraints: BoxConstraints(
          minWidth: 200,
          maxWidth: getMaxWidth(context, maxPercentageWidth: 0.85, maxNumericalWidth: 400),
        ),
        child: TextFormField(
          style: Fonts.fieldText.copyWith(color: colorOrError(AppColors.grey2)),
          cursorColor: colorOrError(AppColors.grey2),
          obscureText: obscureField,
          autocorrect: false,
          enableSuggestions: false,
          onChanged: onChanged,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorOrError(AppColors.grey3))),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorOrError(AppColors.grey2), width: 2)),
            hintText: hintText,
            hintStyle: Fonts.hint.copyWith(color: colorOrError(AppColors.grey3)),
          ),
        ),
      );

  Color colorOrError(Color color) => hasError ? AppColors.error : color;
}
