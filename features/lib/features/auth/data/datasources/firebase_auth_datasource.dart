import 'package:features/features/auth/data/error/auth_firebase_errors.dart';
import 'package:flutter/services.dart';
import 'package:infra/infra.dart';

import '../../auth.dart';

class FirebaseAuthDatasource implements AuthDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore store;
  FirebaseAuthDatasource({required this.auth, required this.store});

  @override
  Future<Result<Failure, UserModel>> login({required Email email, required Password password}) async {
    final signInCall = auth.signInWithEmailAndPassword(
      email: email.get,
      password: password.get,
    );
    return signInCall.then(
      (user) => Success(
        UserModel(
          userId: UuidFactory.newUuid,
          email: user.user!.email,
          name: user.additionalUserInfo?.username,
        ),
      ),
    );
  }

  @override
  Future<Result<Failure, UserModel>> register({
    required String name,
    required Email email,
    required Password password,
  }) async {
    try {
      final signUpCall = auth.createUserWithEmailAndPassword(
        email: email.get,
        password: password.get,
      );
      return signUpCall.then(
        (user) => Success(
          UserModel(
            userId: UuidFactory.newUuid,
            email: email.get,
            name: user.additionalUserInfo?.username,
          ),
        ),
      );
    } on PlatformException catch (e) {
      print(e);
      return Error(FirebaseAuthFailure());
    } catch (e) {
      print(e);
      return Error(FirebaseAuthFailure());
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
