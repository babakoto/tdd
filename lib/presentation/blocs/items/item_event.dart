part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnFindItems extends ItemEvent {}
