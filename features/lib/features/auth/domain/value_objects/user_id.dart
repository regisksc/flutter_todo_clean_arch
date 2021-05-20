import 'package:infra/infra.dart';

import '../../auth.dart';

class UserId {
  // This value object never fails to instantiate
  // Therefore it's unnecessary to extend the value object abstraction
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
