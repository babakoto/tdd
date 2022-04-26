import 'package:clean_tdd_bloc/data/models/item_model.dart';
import 'package:clean_tdd_bloc/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const iItemModel = ItemModel(id: 1, name: "PC", price: 100);
  test('ItemModel should be subclass of ItemEntity', () {
    expect(iItemModel, isA<ItemEntity>());
  });
}
