import 'package:clean_tdd_bloc/core/error/failure.dart';
import 'package:clean_tdd_bloc/core/generics/multi_result.dart';
import 'package:clean_tdd_bloc/core/generics/usecase.dart';
import 'package:clean_tdd_bloc/domain/domain.dart';

class FindItemByIdUseCase extends UseCase<ItemEntity, int> {
  final ItemRepository repository;

  FindItemByIdUseCase({
    required this.repository,
  });

  @override
  Future<Result<Failure, ItemEntity>> call({int? param}) {
    return repository.findItemById(id: param);
  }
}
