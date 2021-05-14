import 'package:flutter_modular/flutter_modular.dart';

abstract class RoutingAdapter {
  static Future<T?>? navTo<T>({
    required String route,
    Object? args,
    Map<String, String>? params,
  }) async =>
      Modular.to.pushNamed(route, arguments: args);

  static Future<T?>? killAndNavTo<T>({
    required String route,
    Object? args,
    T? result,
  }) async =>
      Modular.to.pushReplacementNamed(
        route,
        arguments: args,
        result: result,
      );

  static Future<T?>? killAllAndNavTo<T>({
    required String route,
    Object? args,
  }) async =>
      Modular.to.pushNamedAndRemoveUntil(route, (_) => true);
}
