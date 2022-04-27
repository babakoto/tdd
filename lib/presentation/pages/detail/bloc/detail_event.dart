part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class OnFindItemById extends DetailEvent {
  final int id;

  OnFindItemById({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
