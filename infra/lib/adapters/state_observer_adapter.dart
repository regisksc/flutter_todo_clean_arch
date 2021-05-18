import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StateObserverAdapter extends StatelessWidget {
  // ignore: diagnostic_describe_all_properties
  final Widget Function(BuildContext) adapteeBuilder;
  const StateObserverAdapter({required this.adapteeBuilder});

  @override
  Widget build(BuildContext context) => Observer(builder: adapteeBuilder);
}
