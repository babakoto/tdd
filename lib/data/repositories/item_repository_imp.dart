import 'package:clean_tdd_bloc/core/error/expections.dart';
import 'package:clean_tdd_bloc/core/error/failure.dart';
import 'package:clean_tdd_bloc/core/generics/multi_result.dart';
import 'package:clean_tdd_bloc/data/models/item_model.dart';
import 'package:clean_tdd_bloc/data/sources/local/local_source.dart';
import 'package:clean_tdd_bloc/data/sources/network/network_source.dart';
import 'package:clean_tdd_bloc/data/sources/server/server_source.dart';
import 'package:clean_tdd_bloc/domain/entities/item_entity.dart';
import 'package:clean_tdd_bloc/domain/repositories/item_repository.dart';

class ItemRepositoryImp implements ItemRepository {
  final ServerSource serverSource;
  final LocalSource localSource;
  final NetworkSource networkSource;

  const ItemRepositoryImp({
    required this.serverSource,
    required this.localSource,
    required this.networkSource,
  });

  @override
  Future<Result<Failure, List<ItemEntity>>> findItems() async {
    try {
      if (await networkSource.isOnline()) {
        final List<ItemModel> result = await serverSource.findItems();
        return Success(result);
      } else {
        return Error(NetworkFailure());
      }
    } on ServerException {
      return Error(ServerFailure());
    } on NetworkException {
      return Error(NetworkFailure());
    }
  }
}
