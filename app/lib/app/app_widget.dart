import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:presentation/design/design.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: 'Flutter Clean Architecture toDo App',
        initialRoute: '/auth',
      ).modular();
}
