import 'package:features/features/auth/domain/entities/entities.dart';
import 'package:infra/infra.dart';

import '../../../features.dart';

class UserModel extends Model {
  final String? name;
  final String? email;

  UserModel({this.name, this.email});
  @override
  UserModel fromJson(Map<String, dynamic> json) => UserModel(name: json['name'], email: json['email']);

  @override
  Map<String, dynamic> get toJson {
    return {'name': name, 'email': email};
  }

  @override
  UserEntity get toEntity => UserEntity(name: name ?? '', email: Email(email ?? ''));
}
