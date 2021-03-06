import 'package:infra/infra.dart';

mixin Navigation {
  void navigateTo(
    String route, {
    bool clearRouteStack = false,
    Object? args,
  }) =>
      clearRouteStack
          ? Modular.to.pushNamedAndRemoveUntil(route, (_) => true, arguments: args)
          : Modular.to.pushNamed(route, arguments: args);
}
