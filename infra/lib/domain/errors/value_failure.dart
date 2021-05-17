abstract class ValueFailure<T> {
  final T value;
  final String message;
  ValueFailure(this.value, this.message);
}

class InvalidEmail extends ValueFailure<String> {
  InvalidEmail(String value) : super(value, 'This e-mail seems to be invalid');
}

class InvalidPassword extends ValueFailure<String> {
  InvalidPassword(String value) : super(value, 'Input a stronger password');
}
