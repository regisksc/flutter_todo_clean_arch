import 'package:infra/infra.dart';

class MissingField extends ValueFailure<String> {
  MissingField(String valueType) : super("", "You need to input $valueType");
  @override
  List<Object?> get props => [value, super.description];
}

class UninitializedField extends MissingField {
  UninitializedField(String valueType) : super(valueType);
}

class EmptyField extends MissingField {
  EmptyField(String valueType) : super(valueType);
}
