import 'package:infra/infra.dart';

class InvalidEmail extends ValueFailure<String> {
  InvalidEmail(String value) : super(value, 'This e-mail seems to be invalid');
  @override
  List<Object?> get props => [value, super.description];
}

class InvalidPassword extends ValueFailure<String> {
  InvalidPassword(String value) : super(value, 'Input a stronger password');
  @override
  List<Object?> get props => [value, super.description];
}
