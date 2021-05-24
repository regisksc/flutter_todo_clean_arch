// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on AuthControllerBase, Store {
  Computed<List<ValueFailure<dynamic>>>? _$failuresComputed;

  @override
  List<ValueFailure<dynamic>> get failures => (_$failuresComputed ??=
          Computed<List<ValueFailure<dynamic>>>(() => super.failures,
              name: 'AuthControllerBase.failures'))
      .value;
  Computed<bool>? _$readyToProceedComputed;

  @override
  bool get readyToProceed =>
      (_$readyToProceedComputed ??= Computed<bool>(() => super.readyToProceed,
              name: 'AuthControllerBase.readyToProceed'))
          .value;
  Computed<String>? _$actionTitleComputed;

  @override
  String get actionTitle =>
      (_$actionTitleComputed ??= Computed<String>(() => super.actionTitle,
              name: 'AuthControllerBase.actionTitle'))
          .value;

  final _$signStateAtom = Atom(name: 'AuthControllerBase.signState');

  @override
  SignState get signState {
    _$signStateAtom.reportRead();
    return super.signState;
  }

  @override
  set signState(SignState value) {
    _$signStateAtom.reportWrite(value, super.signState, () {
      super.signState = value;
    });
  }

  final _$pageStateAtom = Atom(name: 'AuthControllerBase.pageState');

  @override
  PageState get pageState {
    _$pageStateAtom.reportRead();
    return super.pageState;
  }

  @override
  set pageState(PageState value) {
    _$pageStateAtom.reportWrite(value, super.pageState, () {
      super.pageState = value;
    });
  }

  final _$emailAtom = Atom(name: 'AuthControllerBase.email');

  @override
  Email get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(Email value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: 'AuthControllerBase.password');

  @override
  Password get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(Password value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom =
      Atom(name: 'AuthControllerBase.confirmPassword');

  @override
  Password get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(Password value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$nameAtom = Atom(name: 'AuthControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$AuthControllerBaseActionController =
      ActionController(name: 'AuthControllerBase');

  @override
  void changeSignState() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.changeSignState');
    try {
      return super.changeSignState();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
signState: ${signState},
pageState: ${pageState},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
name: ${name},
failures: ${failures},
readyToProceed: ${readyToProceed},
actionTitle: ${actionTitle}
    ''';
  }
}
