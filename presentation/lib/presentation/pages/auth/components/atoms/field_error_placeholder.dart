import 'package:features/features.dart';
import 'package:flutter/material.dart';
import 'package:infra/domain/domain.dart';

import '../../../../../presentation.dart';

class FieldErrorPlaceholder extends StatelessWidget {
  const FieldErrorPlaceholder({
    required this.failures,
    Key? key,
  }) : super(key: key);
  final List<ValueFailure> failures;
  @override
  Widget build(BuildContext context) {
    String failureMessage = '';
    if (failures.isNotEmpty) {
      failureMessage = failures.first is UninitializedField ? '' : failures[0].message;
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
      child: Text(
        failureMessage,
        style: Fonts.headline2.copyWith(color: AppColors.error),
      ),
    );
  }
}
