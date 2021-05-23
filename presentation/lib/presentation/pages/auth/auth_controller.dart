import 'package:features/features.dart';
import 'package:infra/exports/dependencies.dart';
import 'package:infra/infra.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

enum SignState { isSignIn, isSignUp }
enum PageState { idle, loading, buttonEnabled }
typedef FieldFailure = ValueFailure<String>;

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  final animDuration = const Duration(milliseconds: 400);
  @observable
  SignState signState = SignState.isSignIn;
  @observable
  PageState pageState = PageState.idle;
  @action
  void changeSignState() =>
      signState == SignState.isSignIn ? signState = SignState.isSignUp : signState = SignState.isSignIn;

  @observable
  Email email = Email();
  void setEmail(String input) => email = Email(input);
  bool get invalidEmail => email.isInvalid && email.get is! UninitializedField;

  @observable
  Password password = Password();
  void setPassword(String input) => password = Password(input);
  bool get invalidPassword => password.isInvalid && password.get is! UninitializedField;

  @observable
  Password confirmPassword = Password();
  void setConfirmPassword(String input) => confirmPassword = Password(input);
  bool get invalidConfirmPassword => confirmPassword.isInvalid && confirmPassword.get is! UninitializedField;

  @observable
  String? name;
  void setName(String input) => name = input;

  @computed
  List<ValueFailure> get failures {
    final failures = <FieldFailure>[];
    if (email.isInvalid) failures.add(email.get as FieldFailure);
    if (password.isInvalid) failures.add(password.get as FieldFailure);
    if (password != confirmPassword) failures.add(NonMatchingPasswords());
    return failures;
  }

  // bool get everythingIsFilled =>
  @computed
  bool get readyToProceed => failures.isEmpty;

  @computed
  String get actionTitle => signState == SignState.isSignIn ? 'Login' : 'Register';

  void handleActionTap() {
    if (readyToProceed) {
      switch (signState) {
        case SignState.isSignIn:
          _login();
          break;
        case SignState.isSignUp:
          _register();
          break;
      }
    }
  }

  Future<void> _login() async {
    final usecase = Modular.get<LogUserInUsecase>();
    pageState = PageState.loading;
    final login = await usecase(LogUserInParams(email: email, password: password));
    pageState = PageState.idle;
  }

  void _register() {}
}
