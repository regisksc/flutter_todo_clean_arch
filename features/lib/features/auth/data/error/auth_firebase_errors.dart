import 'package:infra/infra.dart';

class FirebaseAuthFailure extends Failure {
  final String? message;
  FirebaseAuthFailure([this.message])
      : super(description: message ?? "We've had a little problem trying to reach your data. Try again in a little");

  @override
  List<Object?> get props => [message];
}

class UserNotFoundFailure extends FirebaseAuthFailure {
  UserNotFoundFailure() : super('Your data has not been found. Please sign up!');
}
