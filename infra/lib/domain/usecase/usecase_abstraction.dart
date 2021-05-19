import '../../infra.dart';

abstract class Usecase<Output, Input> {
  Future<Result<Failure, Output>> call(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
