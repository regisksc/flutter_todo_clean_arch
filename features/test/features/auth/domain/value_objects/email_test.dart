import 'package:features/features/auth/domain/domain.dart';
import 'package:infra/infra.dart';

void main() {
  test(
    'should build a correct Email with provided correct input',
    () async {
      // arrange
      final input = 'regisksc@gmail.com';

      // act
      final valueObject = Email(input);

      // assert
      final internalValue = valueObject.value.get();
      expect(internalValue, isA<String>());
    },
  );

  test(
    'should contain a failure on invalid input',
    () async {
      // arrange
      final input = 'regisksc';

      // act
      final valueObject = Email(input);

      // assert
      final internalValue = valueObject.value.get();
      expect(internalValue, isA<InvalidEmail>());
    },
  );
}
