part of 'detail_bloc.dart';

enum DetailStatus {
  init,
  loading,
  loaded,
  notFoundError,
  serverError,
}

class DetailState extends Equatable {
  final ItemEntity? item;
  final DetailStatus status;

  const DetailState({
    this.item,
    required this.status,
  });

  DetailState copyWith({
    ItemEntity? item,
    DetailStatus? status,
  }) {
    return DetailState(
      item: item ?? this.item,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [item, status];
}
