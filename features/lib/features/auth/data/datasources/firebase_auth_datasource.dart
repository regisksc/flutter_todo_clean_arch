import 'package:features/features/auth/data/error/auth_firebase_errors.dart';
import 'package:infra/infra.dart';

import '../../auth.dart';

class FirebaseAuthDatasource implements AuthDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore store;
  FirebaseAuthDatasource({required this.auth, required this.store});

  @override
  Future<Result<Failure, UserModel>> login({required Email email, required Password password}) async {
    try {
      final signInCall = auth.signInWithEmailAndPassword(
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
  Future<Result<Failure, UserModel>> register({
    required String name,
    required Email email,
    required Password password,
  }) async {
    try {
      final signInCall = auth.createUserWithEmailAndPassword(
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
  Future<bool> saveUserDataAfterRegistering({required UserModel user}) async {
    final collection = store.collection('users');
    final document = collection.doc(user.userId);
    final saveDataCall = document.set(user.toJson);
    return saveDataCall.then((_) => true).catchError((_, __) => false);
  }
}
