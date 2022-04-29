import 'package:bloc_test/bloc_test.dart';
import 'package:clean_tdd_bloc/core/core.dart';
import 'package:clean_tdd_bloc/domain/domain.dart';
import 'package:clean_tdd_bloc/domain/usecases/items/find_item_by_id_usecase.dart';
import 'package:clean_tdd_bloc/presentation/pages/detail/bloc/detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'detail_bloc_test.mocks.dart';

@GenerateMocks([FindItemByIdUseCase])
void main() {
  late MockFindItemByIdUseCase findItemByIdUseCase;
  late DetailBloc detailBloc;

  const id = 1;
  const item = ItemEntity(id: id, name: "Nokia", price: 200);
  const initState = DetailState(status: DetailStatus.init);
  const loading = DetailState(status: DetailStatus.loaded);
  const loaded = DetailState(status: DetailStatus.loaded, item: item);

  blocTest(
    "init detailBloc",
    build: () => detailBloc,
    setUp: () {
      findItemByIdUseCase = MockFindItemByIdUseCase();
      detailBloc = DetailBloc(findItemById: findItemByIdUseCase);
    },
    expect: () => [],
  );

  blocTest(
    "on findItemById Success<Item>,DetailState should return Loading to Loaded with ItemEntity  ",
    build: () => detailBloc,
    setUp: () {
      findItemByIdUseCase = MockFindItemByIdUseCase();
      detailBloc = DetailBloc(findItemById: findItemByIdUseCase);
    },
    act: (DetailBloc bloc) {
      when(findItemByIdUseCase(param: id))
          .thenAnswer((_) async => const Success(item));
      bloc.add(OnFindItemById(id: id));
    },
    expect: () {
      return [
        const DetailState(
          status: DetailStatus.loading,
        ),
        const DetailState(
          item: ItemEntity(id: 1, name: "Nokia", price: 200),
          status: DetailStatus.loaded,
        )
      ];
    },
  );

  blocTest(
    "on findItemById Error<ServerFailure> , DetailState should return Loading to ServerError ",
    build: () => detailBloc,
    setUp: () {
      findItemByIdUseCase = MockFindItemByIdUseCase();
      detailBloc = DetailBloc(findItemById: findItemByIdUseCase);
    },
    act: (DetailBloc bloc) {
      when(findItemByIdUseCase(param: id))
          .thenAnswer((_) async => Error(ServerFailure()));
      bloc.add(OnFindItemById(id: id));
    },
    expect: () {
      return [
        const DetailState(
          status: DetailStatus.loading,
        ),
        const DetailState(
          status: DetailStatus.serverError,
        )
      ];
    },
  );

  blocTest(
    "On item Not found , DetailState should return Loading to NotFoundError ",
    build: () => detailBloc,
    setUp: () {
      findItemByIdUseCase = MockFindItemByIdUseCase();
      detailBloc = DetailBloc(findItemById: findItemByIdUseCase);
    },
    act: (DetailBloc bloc) {
      when(findItemByIdUseCase(param: id))
          .thenAnswer((_) async => Error(NotFoundFailure()));
      bloc.add(OnFindItemById(id: id));
    },
    expect: () {
      return [
        const DetailState(
          status: DetailStatus.loading,
        ),
        const DetailState(
          status: DetailStatus.notFoundError,
        )
      ];
    },
  );

  tearDown(() {
    detailBloc.close();
  });
}
