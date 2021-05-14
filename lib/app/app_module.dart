import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_clean_arch/app/app_widget.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        $AppController,
      ];

  @override
  List<ModularRoute> get routers => [];

  @override
  Widget get bootstrap => AppWidget();
}
