import 'package:features/features/auth/data/error/auth_firebase_errors.dart';
import 'package:features/features.dart';
import 'package:infra/infra.dart';

class AuthMock extends Mock implements FirebaseAuth {}

class FirestoreMock extends Mock implements FirebaseFirestore {}

// ignore: subtype_of_sealed_class
class CollectionReferenceMock extends Mock implements CollectionReference<Map<String, dynamic>> {}

class DocumentReferenceMock extends Mock implements DocumentReference<Map<String, dynamic>> {}

class QuerySnapshotMock extends Mock implements QuerySnapshot<Map<String, dynamic>> {}

class QueryDocumentSnapshotMock extends Mock implements List<QueryDocumentSnapshot<Map<String, dynamic>>> {}

class JsonList extends Mock implements List<Map<String, dynamic>> {}

class UserCredentialMock extends Mock implements UserCredential {}

class FirebaseAuthExceptionMock extends Mock implements FirebaseAuthException {}

void main() {
  late FirebaseAuth auth;
  late FirebaseFirestore store;
  late CollectionReferenceMock collection;
  late DocumentReferenceMock document;
  late QuerySnapshotMock querySnapshot;
  late QueryDocumentSnapshotMock documents;
  late JsonList jsonList;
  late AuthDataSource sut;

  late Email email;
  late Password password;
  late UserModel user;
  late UserCredentialMock userCredential;
  late FirebaseAuthExceptionMock exception;
  late String name;
  setUp(() {
    auth = AuthMock();
    store = FirestoreMock();
    collection = CollectionReferenceMock();
    document = DocumentReferenceMock();
    querySnapshot = QuerySnapshotMock();
    documents = QueryDocumentSnapshotMock();
    jsonList = JsonList();
    sut = FirebaseAuthDatasource(auth: auth, store: store);

    email = Email(faker.internet.email());
    password = Password('Ab123456');
    name = faker.person.name();
    userCredential = UserCredentialMock();
    exception = FirebaseAuthExceptionMock();
    user = UserModel(userId: faker.guid.guid(), name: 'Regis Kian', email: email.get);
  });

  group('sign in', () {
    test(
      'should log the user in on firebase',
      () async {
        // arrange
        when(
          () => auth.signInWithEmailAndPassword(email: email.get, password: password.get),
        ).thenAnswer((_) async => userCredential);
        // act
        final result = await sut.login(email: email, password: password);
        // assert
        verify(
          () => auth.signInWithEmailAndPassword(email: email.get, password: password.get),
        );
        expect(result, isA<Success<Failure, UserModel>>());
        verifyNoMoreInteractions(auth);
      },
    );

    test(
      'should return a FirebaseAuthFailure on throw',
      () async {
        // arrange
        when(
          () => auth.signInWithEmailAndPassword(email: email.get, password: password.get),
        ).thenThrow(exception);
        // act
        final result = await sut.login(email: email, password: password);
        // assert
        verify(
          () => auth.signInWithEmailAndPassword(email: email.get, password: password.get),
        );
        expect(result.get(), isA<FirebaseAuthFailure>());
        verifyNoMoreInteractions(auth);
      },
    );

    test(
      "should retrieve user's userId after login",
      () async {
        // arrange
        final map = Map<String, dynamic>.from({'userId': UuidFactory.newUuid, 'email': email.get, 'name': name});
        when(() => store.collection('users')).thenReturn(collection);
        when(() => collection.get()).thenAnswer((_) async => querySnapshot);
        when(() => querySnapshot.docs).thenReturn(documents);
        when(() => documents.map(any())).thenReturn(jsonList);
        when(() => jsonList.firstWhere(any())).thenReturn(map);
        // act
        final result = await sut.retrieveUserId(email);
        // assert
        verify(() => store.collection('users'));
        verify(() => collection.get());
        verify(() => querySnapshot.docs);
        verify(() => documents.map(any()));
        verify(() => jsonList.firstWhere(any()));
        expect(result, isA<UserId>());
        expect(result.get, equals(map['userId']));
        verifyNoMoreInteractions(store);
      },
    );

    test(
      "should retrieve user's name after login",
      () async {
        // arrange
        final map = Map<String, dynamic>.from({'userId': UuidFactory.newUuid, 'email': email.get, 'name': name});
        when(() => store.collection('users')).thenReturn(collection);
        when(() => collection.get()).thenAnswer((_) async => querySnapshot);
        when(() => querySnapshot.docs).thenReturn(documents);
        when(() => documents.map(any())).thenReturn(jsonList);
        when(() => jsonList.firstWhere(any())).thenReturn(map);
        // act
        final result = await sut.retrieveUserName(email);
        // assert
        verify(() => store.collection('users'));
        verify(() => collection.get());
        verify(() => querySnapshot.docs);
        verify(() => documents.map(any()));
        verify(() => jsonList.firstWhere(any()));
        expect(result, equals(map['name']));
        verifyNoMoreInteractions(store);
      },
    );
  });

  group('sign up', () {
    test(
      'should register user on firebase',
      () async {
        // arrange
        when(
          () => auth.createUserWithEmailAndPassword(email: email.get, password: password.get),
        ).thenAnswer((_) async => userCredential);
        // act
        final result = await sut.register(name: name, email: email, password: password);
        // assert
        verify(
          () => auth.createUserWithEmailAndPassword(email: email.get, password: password.get),
        );
        expect(result, isA<Success<Failure, UserModel>>());
        verifyNoMoreInteractions(auth);
      },
    );

    test(
      'should return a FirebaseAuthFailure on throw',
      () async {
        // arrange
        when(
          () => auth.createUserWithEmailAndPassword(email: email.get, password: password.get),
        ).thenThrow(exception);
        // act
        final result = await sut.register(name: name, email: email, password: password);
        // assert
        verify(
          () => auth.createUserWithEmailAndPassword(email: email.get, password: password.get),
        );
        expect(result.get(), isA<FirebaseAuthFailure>());
        verifyNoMoreInteractions(auth);
      },
    );

    test(
      'should send user data to store after signing up and return true on success',
      () async {
        // arrange
        when(() => store.collection('users')).thenReturn(collection);
        when(() => collection.doc(any())).thenReturn(document);
        when(() => document.set(any())).thenAnswer((_) => Future.value(null));
        // act
        final result = await sut.saveUserDataAfterRegistering(user: user);
        // assert
        verify(() => store.collection('users').doc(any()).set(any()));
        expect(result, isTrue);
        verifyNoMoreInteractions(store);
      },
    );

    test(
      'should send user data to store after signing up and throw on error',
      () async {
        // arrange
        when(() => store.collection('users')).thenReturn(collection);
        when(() => collection.doc(any())).thenReturn(document);
        when(() => document.set(any())).thenThrow(Exception());
        // act
        final result = sut.saveUserDataAfterRegistering(user: user);
        // assert
        expect(() => result, throwsA(isA<Exception>()));
        verify(() => store.collection('users').doc(any()).set(any()));
        verifyNoMoreInteractions(store);
      },
    );
  });
}
