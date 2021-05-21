import 'package:features/features/auth/domain/value_objects/user_id.dart';
import 'package:infra/infra.dart';

import '../../auth.dart';

class UserEntity extends Entity {
  final UserId userId;
  final String name;
  final Email email;

  UserEntity({required this.userId, required this.name, required this.email});
  @override
  List<Object?> get props => [userId.value.get()];

  @override
  UserModel get toModel => UserModel(userId: userId.value.get() as String, name: name, email: email.getOrElse(''));
}
