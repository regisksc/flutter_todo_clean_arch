import 'package:flutter/material.dart';
import '../../presentation.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: Text('ToDo App', style: Theme.of(context).textTheme.headline1),
        ),
      ],
    ).withNotchAvoider(context);
  }
}
