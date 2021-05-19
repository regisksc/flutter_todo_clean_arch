import 'package:infra/infra.dart';

import '../../auth.dart';

abstract class AuthRepository {
  Future<Result<Failure, UserEntity>> registerUser({
    required String name,
    required Email email,
    required Password password,
  });

  Future<Result<Failure, UserEntity>> logUserIn({
    required Email email,
    required Password password,
  });
}
