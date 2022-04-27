import 'package:clean_tdd_bloc/core/core.dart';
import 'package:clean_tdd_bloc/core/generics/usecase.dart';
import 'package:clean_tdd_bloc/domain/entities/item_entity.dart';
import 'package:clean_tdd_bloc/domain/repositories/item_repository.dart';

class NoParam {}

class FindItemsUseCase implements UseCase<List<ItemEntity>, NoParam> {
  final ItemRepository repository;

  const FindItemsUseCase({
    required this.repository,
  });

  @override
  Future<Result<Failure, List<ItemEntity>>> call({NoParam? param}) {
    return repository.findItems();
  }
}
