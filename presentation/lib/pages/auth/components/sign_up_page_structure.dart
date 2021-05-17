import 'package:flutter/material.dart';
import 'package:presentation/pages/auth/components/sign_up_fields.dart';

import '../../../presentation.dart';

class SignUpPageStructure extends StatelessWidget {
  final Size pageSize;

  const SignUpPageStructure({
    required this.pageSize,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text('Register', style: Fonts.headline1).center,
          SizedBox(height: pageSize.height * 0.05),
          SignUpFields(),
          SizedBox(height: pageSize.height * 0.05),
          ButtonWidget(label: 'Register', onTap: () {}),
          const Spacer(),
          SignStateFooter.signUp(),
        ],
      );
}
