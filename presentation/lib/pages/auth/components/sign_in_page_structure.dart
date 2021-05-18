import 'package:flutter/material.dart';

import '../../../presentation.dart';
import 'sign_in_fields.dart';

class SignInPageStructure extends StatelessWidget {
  const SignInPageStructure({
    required this.pageSize,
    Key? key,
  }) : super(key: key);
  final Size pageSize;

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          children: [
            Text('Login', style: Fonts.headline1).center,
            SizedBox(height: pageSize.height * 0.05),
            SignInFields(),
            SizedBox(height: pageSize.height * 0.05),
            ButtonWidget(label: 'Login', onTap: () {}),
            const Spacer(),
            SignStateFooter.signIn(),
          ],
        ),
      );
}
