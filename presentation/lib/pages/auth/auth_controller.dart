import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

enum SignState { isSignIn, isSignUp }

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  @observable
  SignState signState = SignState.isSignIn;
  @action
  void changeSignState() {
    if (signState == SignState.isSignIn) signState = SignState.isSignUp;
    if (signState == SignState.isSignUp) signState = SignState.isSignIn;
  }
}
