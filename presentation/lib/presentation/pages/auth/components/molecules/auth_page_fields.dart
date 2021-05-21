import 'package:flutter/material.dart';
import 'package:infra/infra.dart';

import '../../../../../presentation.dart';

class AuthPageFields extends StatelessWidget {
  AuthPageFields({Key? key, required this.pageSize, required this.isSignIn}) : super(key: key);
  final Size pageSize;
  final bool isSignIn;
  final controller = DiAdapter.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    final oneFieldSpace = pageSize.height * 0.03 + WidgetConsts.fieldHeight;
    return SizedBox(
      height: oneFieldSpace * 4,
      child: Column(
        children: [
          _signUpField(
            isSignIn,
            oneFieldSpace,
            FieldWidget(hintText: 'name', onChanged: () {}),
          ),
          FieldWidget(hintText: 'e-mail', onChanged: () {}),
          SizedBox(height: pageSize.height * 0.03),
          FieldWidget(hintText: 'password', onChanged: () {}),
          SizedBox(height: pageSize.height * 0.03),
          _signUpField(
            isSignIn,
            oneFieldSpace,
            FieldWidget(hintText: 'confirm password', onChanged: () {}),
          ),
        ],
      ),
    );
  }

  AnimatedContainer _signUpField(bool isSignIn, double fieldSpace, FieldWidget field) {
    return AnimatedContainer(
      duration: controller.animDuration,
      height: !isSignIn ? fieldSpace : 0,
      child: Column(
        children: [
          field,
          SizedBox(height: pageSize.height * 0.03),
        ],
      ),
    );
  }
}
