import 'package:flutter/foundation.dart';
import 'package:infra/infra.dart';

export 'email.dart';
export 'password.dart';

@immutable
abstract class ValueObject<T> extends Equatable implements Validatable {
  const ValueObject();
  Result<ValueFailure<T>, T>? get value;

  T getOrElse(T defaultValue) {
    late final content;
    if (value != null) content = value!.get();
    if (isValid) return content as T;
    return defaultValue;
  }

  dynamic get get {
    if (value != null) return value!.get();
  }

  @override
  bool get isValid => value != null && value!.isSuccess();
  @override
  bool get isInvalid => !isValid;

  @override
  String toString() => 'Value($value)';

  @override
  List<Object?> get props => [value];
}
