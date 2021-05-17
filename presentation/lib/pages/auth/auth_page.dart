import 'package:flutter/material.dart';
import 'package:presentation/components/atoms/button_widget.dart';
import 'package:presentation/components/atoms/field_widget.dart';
import '../../presentation.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('ToDo App', style: Fonts.headline1.copyWith(fontSize: 24)).center,
        Text('Login', style: Fonts.headline1).center,
        FieldWidget(hintText: 'e-mail', onChanged: () {}),
        FieldWidget(hintText: 'password', onChanged: () {}),
        ButtonWidget(
          label: 'Login',
          onTap: () {},
        ),
      ],
    ).withNotchAvoider(context);
  }
}
