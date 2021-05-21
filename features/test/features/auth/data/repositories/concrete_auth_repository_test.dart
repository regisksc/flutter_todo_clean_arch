import 'package:features/features/auth/auth.dart';
import 'package:infra/infra.dart';

class FirebaseDataSourceMock extends Mock implements FirebaseAuthDatasource {}

main() {
  late FirebaseDataSourceMock datasource;
  late AuthRepository sut;
  late UserModel model;
  late String name;
  late Email email;
  late Password password;

  setUp(() {
    datasource = FirebaseDataSourceMock();
    sut = ConcreteAuthRepository(datasource);
    name = 'Regis Kian';
    email = Email(faker.internet.email());
    password = Password('Ab123456');

    model = UserModel(email: email.getOrElse(''), name: name);
  });

  test(
    'should login and return a UserEntity on success',
    () async {
      // arrange
      when(() => datasource.login(email: email, password: password)).thenAnswer((_) async => Success(model));
      // act
      final result = await sut.logUserIn(email: email, password: password);
      // assert
      // expect(result, isA<UserEntity>());
    },
  );
}
