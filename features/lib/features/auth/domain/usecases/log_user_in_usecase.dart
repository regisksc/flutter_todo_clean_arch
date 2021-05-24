import 'package:features/features/auth/domain/repositories/auth_repository.dart';
import 'package:infra/infra.dart';

import '../../auth.dart';

class LogUserInUsecase extends Usecase<UserEntity, LogUserInParams> {
  final AuthRepository repository;
  LogUserInUsecase(this.repository);
  @override
  Future<Result<Failure, UserEntity>> call(LogUserInParams params) async {
    final result = await repository.logUserIn(email: params.email, password: params.password);
    return result;
  }
}

class LogUserInParams extends Equatable {
  final Email email;
  final Password password;

  LogUserInParams({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}
