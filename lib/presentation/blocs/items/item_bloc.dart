import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_tdd_bloc/core/core.dart';
import 'package:clean_tdd_bloc/domain/domain.dart';
import 'package:clean_tdd_bloc/domain/usecases/items/find_item_by_id_usecase.dart';
import 'package:clean_tdd_bloc/domain/usecases/items/find_items_usecase.dart';
import 'package:equatable/equatable.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final FindItemsUseCase findItemsUseCase;

  ItemBloc({required this.findItemsUseCase})
      : super(const ItemState(status: ItemStatus.init, items: [])) {
    on<OnFindItems>(_onFindItems);
  }

  Future<void> _onFindItems(OnFindItems event, Emitter<ItemState> emit) async {
    emit(state.copyWith(status: ItemStatus.loading));
    final result = await findItemsUseCase();
    if (result.isSuccess()) {
      emit(state.copyWith(
          items: result.getSuccess(), status: ItemStatus.loaded));
    } else {
      if (result.isError()) {
        if (result.getError() == ServerFailure()) {
          emit(state.copyWith(status: ItemStatus.serverError));
        }
        if (result.getError() == NetworkFailure()) {
          emit(state.copyWith(status: ItemStatus.internetError));
        }
      }
    }
  }
}
