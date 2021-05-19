import 'package:infra/infra.dart';

class FirebaseAuthFailure extends Failure {
  final FirebaseAuthException exception;
  FirebaseAuthFailure(this.exception)
      : super(description: "We've had a little problem trying to reach your data. Try again in a little");
  @override
  List<Object?> get props => [exception];
}
