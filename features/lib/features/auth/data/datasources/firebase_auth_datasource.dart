import 'package:features/features/auth/data/error/auth_firebase_errors.dart';
import 'package:infra/infra.dart';

import '../../auth.dart';

class FirebaseAuthDatasource implements AuthDataSource {
  final FirebaseAuth firebase;
  FirebaseAuthDatasource(this.firebase);

  @override
  Future<Result<Failure, UserModel>> login(Email email, Password password) async {
    try {
      final signInCall = firebase.signInWithEmailAndPassword(
        email: email.getOrElse(''),
        password: password.getOrElse(''),
      );
      return signInCall.then(
        (user) => Success(UserModel(
          email: email.getOrElse(''),
          name: user.additionalUserInfo?.username,
        )),
      );
    } on FirebaseAuthException catch (e) {
      return Error(FirebaseAuthFailure(e));
    }
  }

  @override
  Future<Result<Failure, UserModel>> register(
    String name,
    Email email,
    Password password,
  ) async {
    try {
      final signInCall = firebase.createUserWithEmailAndPassword(
        email: email.getOrElse(''),
        password: password.getOrElse(''),
      );
      return signInCall.then(
        (user) => Success(UserModel(
          email: email.getOrElse(''),
          name: user.additionalUserInfo?.username,
        )),
      );
    } on FirebaseAuthException catch (e) {
      return Error(FirebaseAuthFailure(e));
    }
  }
}
