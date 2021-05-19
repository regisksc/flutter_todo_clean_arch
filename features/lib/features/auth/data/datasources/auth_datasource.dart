import 'package:infra/infra.dart';

import '../../auth.dart';

abstract class AuthDataSource {
  Future<Result<Failure, UserModel>> register(
    String name,
    Email email,
    Password password,
  );

  Future<Result<Failure, UserModel>> login(
    Email email,
    Password password,
  );
}
