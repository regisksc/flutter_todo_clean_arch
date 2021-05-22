import 'package:features/features/auth/domain/value_objects/user_id.dart';
import 'package:features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infra/exports/dependencies.dart';
import 'package:infra/infra.dart';

void main() {
  test(
    'should return a UserModel when casting with toModel',
    () async {
      // arrange
      final user = UserEntity(
        userId: UserId(input: UuidFactory.newUuid),
        name: faker.person.name(),
        email: Email(faker.internet.email()),
      );
      // act
      final model = user.toModel;
      // assert
      expect(model, isA<UserModel>());
    },
  );
}
