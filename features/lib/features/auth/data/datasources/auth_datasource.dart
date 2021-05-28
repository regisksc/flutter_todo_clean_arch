import 'package:infra/infra.dart';

import '../../auth.dart';

abstract class AuthDataSource {
  Future<Result<Failure, UserModel>> register({
    required String name,
    required Email email,
    required Password password,
  });

  Future<bool> saveUserDataAfterRegistering({
    required UserModel user,
  });

  Future<Result<Failure, UserModel>> login({
    required Email email,
    required Password password,
  });

  Future<UserId> retrieveUserId(Email email);
  Future<String> retrieveUserName(Email email);
}
