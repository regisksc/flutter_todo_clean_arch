import 'package:infra/infra.dart';

import '../../auth.dart';
import '../error/auth_firebase_errors.dart';

class FirebaseAuthDatasource implements AuthDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore store;
  FirebaseAuthDatasource({required this.auth, required this.store});

  @override
  Future<Result<Failure, UserModel>> login({required Email email, required Password password}) async {
    try {
      final signInCall = auth.signInWithEmailAndPassword(
        email: email.get,
        password: password.get,
      );
      final result = await signInCall;
      final model = UserModel(
        userId: null,
        email: email.get,
        name: result.additionalUserInfo?.username,
      );
      return Success(model);
    } on FirebaseAuthException catch (e) {
      return Error(FirebaseAuthFailure(e.message));
    }
  }

  @override
  Future<UserId> retrieveUserId(Email email) async {
    final collection = store.collection('users');
    final data = await collection.get();
    final documents = data.docs;
    late final UserId userId;
    try {
      bool matchesEmail(Map<String, dynamic> doc) => doc['email'] == email.get;
      final document = documents.map((e) => Map<String, dynamic>.from(e.data())).firstWhere(matchesEmail);
      userId = UserId(input: document['userId']);
    } on StateError {
      userId = UserId.fresh();
    }
    return userId;
  }

  @override
  Future<String> retrieveUserName(Email email) async {
    final collection = store.collection('users');
    final data = await collection.get();
    final documents = data.docs;
    late final String userName;
    try {
      bool matchesEmail(Map<String, dynamic> doc) => doc['email'] == email.get;
      final document = documents.map((e) => Map<String, dynamic>.from(e.data())).firstWhere(matchesEmail);
      userName = document['name'].toString();
      return userName;
    } on StateError {
      return '';
    }
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
    } on FirebaseAuthException catch (e) {
      return Error(FirebaseAuthFailure(e.message));
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
