import 'package:clean_tdd_bloc/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  const ItemModel({required int id, required String name, required int price})
      : super(
          id: id,
          name: name,
          price: price,
        );

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: (json["id"] as num).toInt(),
      name: json["name"],
      price: (json["price"] as num).toInt(),
    );
  }
}
