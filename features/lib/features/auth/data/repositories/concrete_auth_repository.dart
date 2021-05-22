import 'package:features/features/auth/data/error/auth_firebase_errors.dart';
import 'package:features/features.dart';
import 'package:infra/infra.dart';

class ConcreteAuthRepository implements AuthRepository {
  final AuthDataSource datasource;

  ConcreteAuthRepository(this.datasource);
  @override
  Future<Result<Failure, UserEntity>> logUserIn({required Email email, required Password password}) async {
    final user = await datasource.login(email: email, password: password);
    return user.when(
      (error) => Error(error),
      (success) => Success(success.toEntity),
    );
  }

  @override
  Future<Result<Failure, UserEntity>> registerUser({
    required String name,
    required Email email,
    required Password password,
  }) async {
    final user = await datasource.register(email: email, password: password, name: name);
    return user.when(
      (error) => Error(error),
      (user) async => await datasource.saveUserDataAfterRegistering(user: user)
          ? Success(user.toEntity)
          : Error(FirebaseAuthFailure()),
    );
  }
}
