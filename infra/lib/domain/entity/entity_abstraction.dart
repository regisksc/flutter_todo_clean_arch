import 'package:infra/infra.dart';

abstract class Entity extends Equatable {
  Model get toModel;
}
