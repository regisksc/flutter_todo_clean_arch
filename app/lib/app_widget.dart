import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:presentation/presentation.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Clean Architecture toDo App',
        debugShowCheckedModeBanner: false,
        // builder: (context, child) => child!.responsive(context),
        initialRoute: '/auth',
      ).modular();
}
