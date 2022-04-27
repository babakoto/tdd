import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_tdd_bloc/core/core.dart';
import 'package:clean_tdd_bloc/domain/domain.dart';
import 'package:clean_tdd_bloc/domain/usecases/items/find_item_by_id_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final FindItemByIdUseCase findItemById;
  DetailBloc({required this.findItemById})
      : super(const DetailState(status: DetailStatus.init)) {
    on<OnFindItemById>(_onFindItemById);
  }

  Future<void> _onFindItemById(
      OnFindItemById event, Emitter<DetailState> emit) async {
    emit(
      state.copyWith(
        status: DetailStatus.loading,
      ),
    );

    final result = await findItemById(param: event.id);

    if (result.isSuccess()) {
      emit(state.copyWith(
          item: result.getSuccess(), status: DetailStatus.loaded));
    } else {
      if (result.isError()) {
        if (result.getError() == ServerFailure()) {
          emit(state.copyWith(status: DetailStatus.serverError));
        }
        if (result.getError() == NotFoundFailure()) {
          emit(state.copyWith(status: DetailStatus.notFoundError));
        }
      }
    }
  }
}
