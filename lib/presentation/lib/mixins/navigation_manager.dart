import 'package:infra/exports/app_dependencies.dart';

mixin Navigation {
  void navigateTo(
    String route, {
    bool clear = false,
    Object? args,
  }) =>
      clear == true
          ? Modular.to.pushNamedAndRemoveUntil(route, (_) => true, arguments: args)
          : Modular.to.pushNamed(route, arguments: args);
}
