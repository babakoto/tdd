import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  final int id;
  final String name;
  final int price;

  const ItemEntity({
    required this.id,
    required this.name,
    required this.price,
  });

  @override
  List<Object> get props => [id, name, price];
}
