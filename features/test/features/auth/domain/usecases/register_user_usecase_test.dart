import 'package:features/features/auth/domain/domain.dart';
import 'package:infra/infra.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {}

class FailureMock extends Mock implements Failure {}

void main() {
  late AuthRepositoryMock repository;
  late RegisterUserUsecase sut;
  late String name;
  late Email email;
  late Password password;
  late UserEntity user;
  late FailureMock failure;
  setUp(() {
    repository = AuthRepositoryMock();
    sut = RegisterUserUsecase(repository);

    name = faker.person.name();
    email = Email(faker.internet.email());
    password = Password('Ab123456');
    user = UserEntity(name: 'Regis Kian', email: email);
    failure = FailureMock();
  });

  test(
    'should return a UserEntity on repository fetch success',
    () async {
      // arrange
      when(
        () => repository.registerUser(name: name, email: email, password: password),
      ).thenAnswer((_) async => Success(user));
      // act
      final result = await sut(RegisterUserParams(name: name, email: email, password: password));
      // assert
      expect(result, isA<Success<Failure, UserEntity>>());
    },
  );

  test(
    'should return a Failure on repository fetch failure',
    () async {
      // arrange
      when(
        () => repository.registerUser(name: name, email: email, password: password),
      ).thenAnswer((_) async => Error(failure));
      // act
      final result = await sut(RegisterUserParams(name: name, email: email, password: password));
      // assert
      expect(result, isA<Error<Failure, UserEntity>>());
    },
  );
}
