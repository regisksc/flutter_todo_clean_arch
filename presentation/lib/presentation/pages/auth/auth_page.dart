import 'package:flutter/material.dart';
import 'package:infra/infra.dart';
import '../../../presentation.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final controller = DiAdapter.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    final pageSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(
          height: pageSize.height * 0.10,
          child: Text(
            'ToDo App',
            style: Fonts.headline1.copyWith(fontSize: 24),
          ).center,
        ),
        Container(
          height: pageSize.height * 0.75,
          margin: EdgeInsets.only(top: pageSize.height * 0.05),
          child: StateObserverAdapter(adapteeBuilder: (_) {
            final isSignIn = controller.signState == SignState.isSignIn;
            return Column(
              children: [
                Text(controller.actionTitle, style: Fonts.headline1).center,
                SizedBox(height: pageSize.height * 0.05),
                AuthPageFields(isSignIn: isSignIn, pageSize: pageSize),
                ButtonWidget(label: controller.actionTitle, onTap: () {}),
                const Spacer(),
                AnimatedSwitcher(
                  duration: controller.animDuration,
                  child: isSignIn ? SignStateFooter.signIn() : SignStateFooter.signUp(),
                ),
              ],
            );
          }),
        ),
        SizedBox(height: pageSize.height * 0.05),
      ],
    ).withNotchAvoider(context);
  }

  // AnimatedSwitcher _switcher(Size pageSize) {
  //   return AnimatedSwitcher(
  //     duration: const Duration(milliseconds: 400),
  //     child: controller.signState == SignState.isSignIn
  //         ? SignInPageStructure(pageSize: pageSize)
  //         : SignUpPageStructure(pageSize: pageSize),
  //   );
  // }
}
