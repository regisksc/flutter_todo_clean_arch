import '../../infra.dart';

abstract class Usecase<Input, Output> {
  Future<Result<Failure, Output>> call(Input params);
}
