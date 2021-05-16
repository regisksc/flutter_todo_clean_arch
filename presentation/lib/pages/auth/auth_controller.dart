import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
