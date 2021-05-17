import 'package:flutter/material.dart';

import '../../../presentation.dart';

class SignUpFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          FieldWidget(hintText: 'name', onChanged: () {}),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          FieldWidget(hintText: 'e-mail', onChanged: () {}),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          FieldWidget(hintText: 'password', onChanged: () {}),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          FieldWidget(hintText: 'confirm password', onChanged: () {}),
        ],
      );
}
