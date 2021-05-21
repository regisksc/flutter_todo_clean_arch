import 'package:flutter/material.dart';
import 'package:infra/infra.dart';

import '../../../../../presentation.dart';
import '../../../../design/design.dart';

class SignStateFooter extends StatelessWidget {
  SignStateFooter.signIn() {
    _description = Text(
      signInStateDescription,
      style: Fonts.footer,
    );
    _action = Text(
      signInAction,
      style: Fonts.footer.copyWith(fontWeight: FontWeight.bold),
    );
  }

  SignStateFooter.signUp() {
    _description = Text(
      signUpStateDescription,
      style: Fonts.footer,
    );
    _action = Text(
      signUpAction,
      style: Fonts.footer.copyWith(fontWeight: FontWeight.bold),
    );
  }
  late Widget _description;
  late Widget _action;

  @override
  Widget build(BuildContext context) {
    final controller = DiAdapter.get<AuthController>();
    return Column(
      children: [
        _description,
        GestureDetector(
          onTap: () => controller.changeSignState(),
          child: _action,
        ),
      ],
    );
  }

  String get signInStateDescription => "Don't have an account?";
  String get signInAction => 'Sign up';
  String get signUpStateDescription => 'Already have an account?';
  String get signUpAction => 'Sign in';
}
