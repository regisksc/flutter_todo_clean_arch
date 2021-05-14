import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StateObserverAdapter extends StatelessWidget {
  final Widget adaptee;
  StateObserverAdapter(this.adaptee);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) => adaptee);
  }
}
