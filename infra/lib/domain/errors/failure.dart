import '../../infra.dart';

abstract class Failure extends Equatable {
  final String description;
  const Failure({required this.description});
}
