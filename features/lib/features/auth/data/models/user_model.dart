import 'package:features/features/auth/domain/entities/entities.dart';
import 'package:features/features/auth/domain/value_objects/user_id.dart';
import 'package:infra/infra.dart';

import '../../../../features.dart';

class UserModel extends Model {
  final String? userId;
  final String? name;
  final String? email;

  UserModel({this.userId, this.name, this.email});
  @override
  UserModel fromJson(Map<String, dynamic> json) => UserModel(
        userId: json['userId'],
        name: json['name'],
        email: json['email'],
      );

  @override
  Map<String, dynamic> get toJson {
    return {'userId': userId, 'name': name, 'email': email};
  }

  @override
  UserEntity get toEntity => UserEntity(
        userId: UserId(input: userId),
        name: name ?? '',
        email: Email(email ?? ''),
      );
}
