import 'package:infra/infra.dart';

class InvalidUserId extends ValueFailure<String> {
  InvalidUserId(String value) : super(value, 'This id is not a valid id');
  @override
  List<Object?> get props => [value, super.description];
}
