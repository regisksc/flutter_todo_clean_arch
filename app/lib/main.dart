import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'app_widget.dart';

// ignore: prefer_expression_function_bodies
void main() {
  return runApp(
    ModularApp(module: AppModule(), child: AppWidget()),
  );
}
