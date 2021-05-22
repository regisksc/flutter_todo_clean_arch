import 'package:features/features.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> map;
  setUp(() {
    map = {
      'name': 'Regis Kian',
      'email': 'regisksc@gmail.com',
    };
  });

  test(
    'should create a Model from a given json',
    () async {
      // arrange
      late UserModel model;
      // act
      model = UserModel().fromJson(map);
      // assert
      expect(model, isA<UserModel>());
      expect(model.name, equals(map['name']));
      expect(model.email, equals(map['email']));
    },
  );

  test(
    'should convert Model to Json',
    () async {
      // arrange
      final model = UserModel().fromJson(map);
      // act
      final json = model.toJson;
      // assert
      expect(json, isA<Map<String, dynamic>>());
      expect(json.containsKey('name'), isTrue);
      expect(json.containsKey('email'), isTrue);
    },
  );

  test(
    'should convert Model to Entity',
    () async {
      // arrange
      final model = UserModel().fromJson(map);
      // act
      final entity = model.toEntity;
      // assert
      expect(entity, isA<UserEntity>());
    },
  );
}
