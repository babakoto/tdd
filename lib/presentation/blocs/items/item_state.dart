part of 'item_bloc.dart';

enum ItemStatus {
  init,
  loading,
  loaded,
  serverError,
  internetError,
  notFoundError
}

class ItemState extends Equatable {
  final ItemStatus status;
  final List<ItemEntity> items;
  final ItemEntity? currentItem;

  const ItemState(
      {required this.status, required this.items, this.currentItem});

  ItemState copyWith({
    ItemStatus? status,
    List<ItemEntity>? items,
    ItemEntity? currentItem,
  }) {
    return ItemState(
      status: status ?? this.status,
      items: items ?? this.items,
      currentItem: currentItem ?? this.currentItem,
    );
  }

  @override
  List<Object?> get props => [status, items, currentItem];
}
