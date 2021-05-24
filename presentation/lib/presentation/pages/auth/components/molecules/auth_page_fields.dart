import 'package:features/features/auth/domain/error/error.dart';
import 'package:flutter/material.dart';
import 'package:infra/infra.dart';

import '../../../../../presentation.dart';

class AuthPageFields extends StatelessWidget {
  AuthPageFields({Key? key, required this.pageSize, required this.isSignIn}) : super(key: key);
  final Size pageSize;
  final bool isSignIn;
  final controller = DiAdapter.get<AuthController>();

  double get oneFieldSpace => pageSize.height * 0.03 + WidgetConsts.fieldHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: oneFieldSpace * 5,
      child: StateObserverAdapter(
        adapteeBuilder: (_) {
          return Column(
            children: [
              _signUpField(FieldWidget(hintText: 'name', onChanged: controller.setName)),
              FieldWidget(
                hintText: 'e-mail',
                onChanged: controller.setEmail,
                hasError: controller.invalidEmail,
              ),
              SizedBox(height: pageSize.height * 0.03),
              FieldWidget(
                controller: controller.passwordController,
                hintText: 'password',
                obscureField: true,
                onChanged: controller.setPassword,
                hasError: controller.password.isInvalid && controller.password.get is! UninitializedField,
              ),
              SizedBox(height: pageSize.height * 0.03),
              _signUpField(FieldWidget(
                controller: controller.confirmPasswordController,
                hintText: 'confirm password',
                onChanged: controller.setConfirmPassword,
                obscureField: true,
                hasError: controller.confirmPassword.isInvalid && controller.confirmPassword.get is! UninitializedField,
              )),
              FieldErrorPlaceholder(failures: controller.failures),
            ],
          );
        },
      ),
    );
  }

  AnimatedOpacity _signUpField(FieldWidget field) {
    return AnimatedOpacity(
      duration: controller.animDuration,
      opacity: !isSignIn ? 1 : 0,
      child: AnimatedContainer(
        duration: controller.animDuration,
        height: !isSignIn ? oneFieldSpace : 0,
        child: Column(
          children: [field, SizedBox(height: pageSize.height * 0.03)],
        ),
      ),
    );
  }
}
