import 'package:features/features/auth/domain/domain.dart';
import 'package:infra/infra.dart';

void main() {
  test(
    'should build a correct Password with provided correct input',
    () async {
      // arrange
      final input = 'Ab123456';
      // act
      final valueObject = Password(input);
      // assert
      final internalValue = valueObject.get;
      expect(internalValue, isA<String>());
    },
  );

  test(
    'should contain a failure on invalid input',
    () async {
      late String input;
      late Password valueObject;
      late dynamic internalValue;
      // arrange
      input = 'abcdefgh';
      // act
      valueObject = Password(input);
      // assert
      internalValue = valueObject.get;
      expect(internalValue, isA<InvalidPassword>());

      // arrange
      input = 'Ab1';
      // act
      valueObject = Password(input);
      // assert
      internalValue = valueObject.get;
      expect(internalValue, isA<InvalidPassword>());

      // arrange
      input = '123456789';
      // act
      valueObject = Password(input);
      // assert
      internalValue = valueObject.get;
      expect(internalValue, isA<InvalidPassword>());
    },
  );
}
