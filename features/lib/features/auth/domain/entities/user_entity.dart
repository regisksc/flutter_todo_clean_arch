import 'package:infra/exports/dependencies.dart';
import 'package:infra/infra.dart';

import '../../auth.dart';

class UserEntity extends Entity {
  final String name;
  final Email email;

  UserEntity({required this.name, required this.email});
  @override
  List<Object?> get props => [name, email];

  @override
  UserModel get toModel => UserModel(name: name, email: email.getOrElse(''));
}
