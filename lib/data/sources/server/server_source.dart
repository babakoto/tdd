import 'package:clean_tdd_bloc/data/models/item_model.dart';

abstract class ServerSource {
  Future<List<ItemModel>> findItems();
  Future<ItemModel?> findItemById({int? id});
}
