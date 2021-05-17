import 'package:flutter/material.dart';
import 'package:infra/exports/dependencies.dart';
import '../../presentation.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final controller = Modular.get<AuthController>();
  @override
  Widget build(BuildContext context) {
    final pageSize = MediaQuery.of(context).size;
    final isSignIn = controller.signState == SignState.isSignIn;
    return Column(
      children: <Widget>[
        Expanded(
          flex: 15,
          child: Text(
            'ToDo App',
            style: Fonts.headline1.copyWith(fontSize: 24),
          ).center,
        ),
        SizedBox(height: pageSize.height * 0.15),
        Expanded(
          flex: 80,
          child: AnimatedCrossFade(
            crossFadeState: isSignIn ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: SignInPageStructure(pageSize: pageSize),
            secondChild: SignUpPageStructure(pageSize: pageSize),
            duration: const Duration(milliseconds: 400),
          ),
        ),
        const Spacer(flex: 5),
      ],
    ).withNotchAvoider(context);
  }
}
