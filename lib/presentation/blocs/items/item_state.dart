part of 'item_bloc.dart';

enum ItemStatus {
  init,
  loading,
  loaded,
  serverError,
  internetError,
}

class ItemState extends Equatable {
  final ItemStatus status;
  final List<ItemEntity> items;

  const ItemState({
    required this.status,
    required this.items,
  });

  ItemState copyWith({
    ItemStatus? status,
    List<ItemEntity>? items,
  }) {
    return ItemState(
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [status, items];
}
