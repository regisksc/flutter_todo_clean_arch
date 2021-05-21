import 'package:infra/infra.dart';

import '../../auth.dart';

class UserId extends ValueObject<String> {
  UserId._(this.value);
  @override
  final Result<ValueFailure<String>, String> value;

  factory UserId({String? input}) {
    if (input == null) return UserId._(Success(UuidFactory.newUuid));
    try {
      return UserId._(Success(UuidFactory.uuidFrom(input)));
    } on FormatException {
      return UserId._(Error(InvalidUserId(input)));
    }
  }
}
