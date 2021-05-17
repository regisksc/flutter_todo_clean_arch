import 'package:flutter/foundation.dart';
import 'package:infra/infra.dart';

export 'email.dart';
export 'password.dart';

@immutable
abstract class ValueObject<T> implements Validatable {
  const ValueObject();
  Result<ValueFailure<T>, T> get value;

  T getOrElse(T defaultValue) {
    final content = value.get();
    if (content.isSuccess()) return content as T;
    return defaultValue;
  }

  @override
  bool get isValid => value.get().isSuccess();

  @override
  String toString() => 'Value($value)';
}
