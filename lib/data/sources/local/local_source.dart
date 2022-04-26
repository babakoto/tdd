import 'package:clean_tdd_bloc/data/models/item_model.dart';

abstract class LocalSource {
  Future<List<ItemModel>> findItems();
}
