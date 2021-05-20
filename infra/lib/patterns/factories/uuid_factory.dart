import 'package:uuid/uuid.dart';

/// Operates on UUID V4 values
class UuidFactory {
  UuidFactory._();
  static Uuid? _uuid;
  static Uuid _instance() {
    _uuid ??= const Uuid();
    return _uuid!;
  }

  static String get newUuid => _instance().v4();
  static String uuidFrom(String uuidCandidate) => UuidValue(uuidCandidate).uuid;
}
