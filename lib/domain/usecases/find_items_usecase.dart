import 'package:clean_tdd_bloc/core/core.dart';
import 'package:clean_tdd_bloc/domain/entities/item_entity.dart';
import 'package:clean_tdd_bloc/domain/repositories/item_repository.dart';

class FindItemsUseCase {
  final ItemRepository repository;

  const FindItemsUseCase({
    required this.repository,
  });

  Future<Result<Failure, List<ItemEntity>>> call() async {
    return repository.findItems();
  }
}
