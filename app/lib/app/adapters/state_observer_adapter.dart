import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StateObserverAdapter extends StatelessWidget {
  final Widget adaptee;
  const StateObserverAdapter(this.adaptee);

  @override
  Widget build(BuildContext context) => Observer(builder: (context) => adaptee);
}
