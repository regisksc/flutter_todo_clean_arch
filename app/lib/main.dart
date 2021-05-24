import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'app_widget.dart';

// ignore: prefer_expression_function_bodies
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  return runApp(
    ModularApp(module: AppModule(), child: AppWidget()),
  );
}
