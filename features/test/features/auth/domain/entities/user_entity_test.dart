import 'package:features/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infra/exports/dependencies.dart';

void main() {
  test(
    'should return a UserModel when casting with toModel',
    () async {
      // arrange
      final user = UserEntity(
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
