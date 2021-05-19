import 'package:features/features/auth/data/error/auth_firebase_errors.dart';
import 'package:features/features/features.dart';
import 'package:infra/infra.dart';

class FirebaseMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class FirebaseAuthExceptionMock extends Mock implements FirebaseAuthException {}

void main() {
  late FirebaseAuth firebase;
  late AuthDataSource sut;
  late Email email;
  late Password password;
  late UserModel user;
  late UserCredentialMock userCredential;
  late FirebaseAuthExceptionMock exception;
  late String name;
  setUp(() {
    firebase = FirebaseMock();
    sut = FirebaseAuthDatasource(firebase);
    email = Email(faker.internet.email());
    password = Password('Ab123456');
    name = faker.person.name();
    userCredential = UserCredentialMock();
    exception = FirebaseAuthExceptionMock();
    user = UserModel(name: 'Regis Kian', email: email.getOrElse(''));
  });

  group('sign in', () {
    test(
      'should log the user in on firebase',
      () async {
        // arrange
        when(
          () => firebase.signInWithEmailAndPassword(email: email.getOrElse(''), password: password.getOrElse('')),
        ).thenAnswer((_) async => userCredential);
        // act
        final result = await sut.login(email, password);
        // assert
        verify(
          () => firebase.signInWithEmailAndPassword(email: email.getOrElse(''), password: password.getOrElse('')),
        );
        expect(result, isA<Success<Failure, UserModel>>());
        verifyNoMoreInteractions(firebase);
      },
    );

    test(
      'should return a FirebaseAuthFailure on throw',
      () async {
        // arrange
        when(
          () => firebase.signInWithEmailAndPassword(email: email.getOrElse(''), password: password.getOrElse('')),
        ).thenThrow(exception);
        // act
        final result = await sut.login(email, password);
        // assert
        verify(
          () => firebase.signInWithEmailAndPassword(email: email.getOrElse(''), password: password.getOrElse('')),
        );
        expect(result.get(), isA<FirebaseAuthFailure>());
        verifyNoMoreInteractions(firebase);
      },
    );
  });

  group('sign up', () {
    test(
      'should register user on firebase',
      () async {
        // arrange
        when(
          () => firebase.createUserWithEmailAndPassword(email: email.getOrElse(''), password: password.getOrElse('')),
        ).thenAnswer((_) async => userCredential);
        // act
        final result = await sut.register(name, email, password);
        // assert
        verify(
          () => firebase.createUserWithEmailAndPassword(email: email.getOrElse(''), password: password.getOrElse('')),
        );
        expect(result, isA<Success<Failure, UserModel>>());
        verifyNoMoreInteractions(firebase);
      },
    );

    test(
      'should return a FirebaseAuthFailure on throw',
      () async {
        // arrange
        when(
          () => firebase.createUserWithEmailAndPassword(email: email.getOrElse(''), password: password.getOrElse('')),
        ).thenThrow(exception);
        // act
        final result = await sut.register(name, email, password);
        // assert
        verify(
          () => firebase.createUserWithEmailAndPassword(email: email.getOrElse(''), password: password.getOrElse('')),
        );
        expect(result.get(), isA<FirebaseAuthFailure>());
        verifyNoMoreInteractions(firebase);
      },
    );
  });
}
