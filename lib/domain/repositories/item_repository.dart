import 'package:clean_tdd_bloc/core/core.dart';
import 'package:clean_tdd_bloc/domain/entities/item_entity.dart';

abstract class ItemRepository {
  Future<Result<Failure, List<ItemEntity>>> findItems();
}
