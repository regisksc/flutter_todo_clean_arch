import 'package:infra/infra.dart';

abstract class DiAdapter {
  DiAdapter._();

  static T get<T extends Object>() => Modular.get<T>();
}
