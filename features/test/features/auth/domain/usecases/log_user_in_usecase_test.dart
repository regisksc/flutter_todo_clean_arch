import 'package:features/features/auth/domain/domain.dart';
import 'package:infra/infra.dart';

import '../../../../utils/mocks/shared_mocks.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {}

void main() {
  late AuthRepositoryMock repository;
  late LogUserInUsecase sut;
  late Email email;
  late Password password;
  late UserEntity user;
  late FailureMock failure;
  setUp(() {
    repository = AuthRepositoryMock();
    sut = LogUserInUsecase(repository);

    email = Email(faker.internet.email());
    password = Password('Ab123456');
    user = UserEntity(
      userId: UserId(input: UuidFactory.newUuid),
      name: 'Regis Kian',
      email: email,
    );
    failure = FailureMock();
  });

  test(
    'should return a UserEntity on repository fetch success',
    () async {
      // arrange
      when(
        () => repository.logUserIn(email: email, password: password),
      ).thenAnswer((_) async => Success(user));
      // act
      final result = await sut(LogUserInParams(email: email, password: password));
      // assert
      expect(result, isA<Success<Failure, UserEntity>>());
    },
  );

  test(
    'should return a Failure on repository fetch failure',
    () async {
      // arrange
      when(
        () => repository.logUserIn(email: email, password: password),
      ).thenAnswer((_) async => Error(failure));
      // act
      final result = await sut(LogUserInParams(email: email, password: password));
      // assert
      expect(result, isA<Error<Failure, UserEntity>>());
    },
  );
}
