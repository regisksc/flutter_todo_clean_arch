abstract class ValueFailure<T> {
  final T value;
  final String message;
  ValueFailure(this.value, this.message);
}
