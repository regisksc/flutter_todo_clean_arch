import 'package:flutter_test/flutter_test.dart';
import 'package:infra/exports/dependencies.dart';
import 'package:infra/patterns/factories/uuid_factory.dart';

void main() {
  test(
    'should return a new Uuid for the first time',
    () async {
      // act
      final _uuid = UuidFactory.newUuid;
      // assert
      expect(_uuid.length, equals(36));
    },
  );

  test(
    'should return create from a uuid string',
    () async {
      // arrange
      final _uuid1 = UuidFactory.newUuid;
      // act
      final validatedUuid = UuidFactory.uuidFrom(_uuid1);
      // assert
      expect(validatedUuid, isA<String>());
    },
  );

  test(
    'should throw on invalid uuid from string',
    () async {
      // arrange
      const _invalidUuid = 'lalala';
      // assert
      try {
        UuidFactory.uuidFrom(_invalidUuid);
      } on FormatException catch (e) {
        expect(e, isA<FormatException>());
      }
    },
  );
}
