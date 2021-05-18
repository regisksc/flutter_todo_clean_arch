import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

enum SignState { isSignIn, isSignUp }

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  @observable
  SignState signState = SignState.isSignIn;
  @action
  void changeSignState() =>
      signState == SignState.isSignIn ? signState = SignState.isSignUp : signState = SignState.isSignIn;

  @computed
  String get actionTitle => signState == SignState.isSignIn ? 'Login' : 'Register';

  final animDuration = const Duration(milliseconds: 400);
}
