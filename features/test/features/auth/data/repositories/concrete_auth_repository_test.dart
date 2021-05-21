import 'package:features/features/auth/auth.dart';
import 'package:infra/infra.dart';

import '../../../../utils/mocks/shared_mocks.dart';

class FirebaseDataSourceMock extends Mock implements FirebaseAuthDatasource {}

main() {
  late FirebaseDataSourceMock datasource;
  late AuthRepository sut;
  late UserModel model;
  late String name;
  late Email email;
  late Password password;
  late FailureMock failure;

  setUp(() {
    datasource = FirebaseDataSourceMock();
    sut = ConcreteAuthRepository(datasource);
    name = 'Regis Kian';
    email = Email(faker.internet.email());
    password = Password('Ab123456');

    model = UserModel(email: email.getOrElse(''), name: name);
    failure = FailureMock();
  });

  test(
    'should login and return a UserEntity on success',
    () async {
      // arrange
      when(() => datasource.login(email: email, password: password)).thenAnswer((_) async => Success(model));
      // act
      final login = await sut.logUserIn(email: email, password: password);
      final result = login.get();
      // assert
      verify(() => datasource.login(email: email, password: password));
      expect(result, isA<UserEntity>());
      verifyNoMoreInteractions(datasource);
    },
  );

  test(
    'should login and return a Failure on failure',
    () async {
      // arrange
      when(() => datasource.login(email: email, password: password)).thenAnswer((_) async => Error(failure));
      // act
      final login = await sut.logUserIn(email: email, password: password);
      final result = login.get();
      // assert
      verify(() => datasource.login(email: email, password: password));
      expect(result, isA<Failure>());
      verifyNoMoreInteractions(datasource);
    },
  );

  test(
    'should register and return a UserEntity on success',
    () async {
      // arrange
      when(
        () => datasource.register(name: name, email: email, password: password),
      ).thenAnswer((_) async => Success(model));
      when(
        () => datasource.saveUserDataAfterRegistering(user: model),
      ).thenAnswer((_) async => true);
      // act
      final register = await sut.registerUser(email: email, password: password, name: name);
      final result = register.get();
      // assert
      verify(() => datasource.register(name: name, email: email, password: password));
      verify(() => datasource.saveUserDataAfterRegistering(user: model));
      expect(result, isA<UserEntity>());
      verifyNoMoreInteractions(datasource);
    },
  );
}
