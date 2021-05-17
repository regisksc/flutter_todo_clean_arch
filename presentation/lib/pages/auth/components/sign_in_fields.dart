import 'package:flutter/material.dart';

import '../../../presentation.dart';

class SignInFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          FieldWidget(hintText: 'e-mail', onChanged: () {}),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          FieldWidget(hintText: 'password', onChanged: () {}),
        ],
      );
}
