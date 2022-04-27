import 'package:clean_tdd_bloc/core/core.dart';

abstract class UseCase<R, P> {
  Future<Result<Failure, R>> call({P param});
}
