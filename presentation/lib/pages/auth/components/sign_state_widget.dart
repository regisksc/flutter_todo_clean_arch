import 'package:flutter/material.dart';
import 'package:presentation/design/design.dart';

class SignStateFooter extends StatelessWidget {
  late Widget _description;
  late Widget _action;

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

  @override
  Widget build(BuildContext context) => Column(children: [_description, _action]);

  String get signInStateDescription => 'Already have an account?';
  String get signInAction => 'Sign in';
  String get signUpStateDescription => 'Don\'t have an account?';
  String get signUpAction => 'Sign up';
}
