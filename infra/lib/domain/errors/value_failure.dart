import '../domain.dart';

abstract class ValueFailure<T> extends Failure {
  final T value;
  final String message;
  const ValueFailure(this.value, this.message) : super(description: message);
}
