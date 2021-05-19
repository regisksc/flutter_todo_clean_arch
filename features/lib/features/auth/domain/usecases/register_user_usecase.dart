import 'package:features/features/auth/domain/repositories/auth_repository.dart';
import 'package:infra/infra.dart';

import '../../auth.dart';

class RegisterUserUsecase extends Usecase<UserEntity, RegisterUserParams> {
  final AuthRepository repository;
  RegisterUserUsecase(this.repository);
  @override
  Future<Result<Failure, UserEntity>> call(RegisterUserParams params) {
    final result = repository.registerUser(name: params.name, email: params.email, password: params.password);
    return result;
  }
}

class RegisterUserParams extends Equatable {
  final String name;
  final Email email;
  final Password password;

  RegisterUserParams({required this.name, required this.email, required this.password});
  @override
  List<Object?> get props => [email, password, name];
}
