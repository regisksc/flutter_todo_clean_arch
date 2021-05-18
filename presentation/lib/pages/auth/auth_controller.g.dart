// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on AuthControllerBase, Store {
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
actionTitle: ${actionTitle}
    ''';
  }
}
