import 'dart:async';

import 'package:features/features.dart';
import 'package:flutter/material.dart';

import 'package:infra/exports/dependencies.dart';
import 'package:infra/infra.dart';
import 'package:mobx/mobx.dart';

import '../../../presentation.dart';

part 'auth_controller.g.dart';

enum SignState { isSignIn, isSignUp }
enum PageState { idle, loading, buttonEnabled }
typedef FieldFailure = ValueFailure<String>;

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store, Navigation, DialogManager {
  final animDuration = const Duration(milliseconds: 400);
  @observable
  SignState signState = SignState.isSignIn;
  @observable
  PageState pageState = PageState.idle;
  @action
  void changeSignState() {
    passwordController.clear();
    confirmPasswordController.clear();
    password = Password();
    confirmPassword = Password();
    signState == SignState.isSignIn ? signState = SignState.isSignUp : signState = SignState.isSignIn;
  }

  @observable
  Email email = Email();
  void setEmail(String input) => email = Email(input);
  bool get invalidEmail => email.isInvalid && email.get is! UninitializedField;

  @observable
  Password password = Password();
  final passwordController = TextEditingController();
  void setPassword(String input) => password = Password(input);
  bool get invalidPassword => password.isInvalid && password.get is! UninitializedField;

  @observable
  Password confirmPassword = Password();
  final confirmPasswordController = TextEditingController();
  void setConfirmPassword(String input) => confirmPassword = Password(input);
  bool get invalidConfirmPassword => confirmPassword.isInvalid && confirmPassword.get is! UninitializedField;

  @observable
  String name = '';
  void setName(String input) => name = input;
  bool get nameIsValid {
    if (signState == SignState.isSignUp) return name != '';
    return true;
  }

  @computed
  List<ValueFailure> get failures {
    final failures = <FieldFailure>[];
    if (email.isInvalid) failures.add(email.get as FieldFailure);
    if (password.isInvalid) failures.add(password.get as FieldFailure);
    if (signState == SignState.isSignUp && password != confirmPassword) failures.add(NonMatchingPasswords());
    return failures;
  }

  @computed
  bool get readyToProceed => failures.isEmpty && nameIsValid;

  @computed
  String get actionTitle => signState == SignState.isSignIn ? 'Login' : 'Register';

  void handleActionTap(BuildContext context) {
    if (readyToProceed) {
      switch (signState) {
        case SignState.isSignIn:
          _auth<LogUserInUsecase>(context, LogUserInParams(email: email, password: password));
          break;
        case SignState.isSignUp:
          _auth<RegisterUserUsecase>(context, RegisterUserParams(email: email, password: password, name: name));
          break;
      }
    }
  }

  Future _auth<T extends Usecase>(BuildContext context, params) async {
    final usecase = Modular.get<T>();
    pageState = PageState.loading;
    final login = await usecase(params);
    pageState = PageState.idle;
    login.when(
      (error) => showDialogWithText(context, error.description),
      (success) => navigateTo('inProgress', args: success, clearRouteStack: true),
    );
  }
}
