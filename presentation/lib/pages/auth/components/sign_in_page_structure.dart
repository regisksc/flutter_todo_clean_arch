import 'package:flutter/material.dart';
import 'package:presentation/pages/auth/components/sign_in_fields.dart';

import '../../../presentation.dart';

class SignInPageStructure extends StatelessWidget {
  final Size pageSize;

  const SignInPageStructure({
    required this.pageSize,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text('Login', style: Fonts.headline1).center,
          SizedBox(height: pageSize.height * 0.05),
          SignInFields(),
          SizedBox(height: pageSize.height * 0.05),
          ButtonWidget(label: 'Login', onTap: () {}),
          const Spacer(),
          SignStateFooter.signIn(),
        ],
      );
}
