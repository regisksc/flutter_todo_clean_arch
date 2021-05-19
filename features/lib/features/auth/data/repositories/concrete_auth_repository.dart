import 'package:features/features/features.dart';
import 'package:infra/infra.dart';

class ConcreteAuthRepository implements AuthRepository {
  final AuthDataSource datasource;

  ConcreteAuthRepository(this.datasource);
  @override
  Future<Result<Failure, UserEntity>> logUserIn({required Email email, required Password password}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<Failure, UserEntity>> registerUser({
    required String name,
    required Email email,
    required Password password,
  }) {
    throw UnimplementedError();
  }
}
