import 'package:bloc_test/bloc_test.dart';
import 'package:clean_tdd_bloc/core/core.dart';
import 'package:clean_tdd_bloc/data/sources/network/network_source.dart';
import 'package:clean_tdd_bloc/domain/domain.dart';
import 'package:clean_tdd_bloc/domain/usecases/items/find_item_by_id_usecase.dart';
import 'package:clean_tdd_bloc/domain/usecases/items/find_items_usecase.dart';
import 'package:clean_tdd_bloc/injection.dart';
import 'package:clean_tdd_bloc/presentation/blocs/items/item_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'item_bloc_test.mocks.dart';

@GenerateMocks([ItemBloc, FindItemsUseCase, NetworkSource])
void main() {
  late ItemBloc itemBloc;
  late MockFindItemsUseCase findItemsUseCase;

  setUp(() {
    findItemsUseCase = MockFindItemsUseCase();
    itemBloc = ItemBloc(findItemsUseCase: findItemsUseCase);
  });

  group("on findItems", () {
    const initState = ItemState(status: ItemStatus.init, items: []);
    const dataStream = ItemState(status: ItemStatus.init, items: []);

    const items = [
      ItemEntity(id: 1, name: "Nokia", price: 200),
      ItemEntity(id: 2, name: "Iphone", price: 500),
    ];

    blocTest("Should emit [] when Bloc create",
        build: () => itemBloc, seed: () => initState, expect: () => []);

    blocTest("Should emit loading > loaded with List ItemEntity",
        build: () => itemBloc,
        seed: () => initState,
        act: (ItemBloc bloc) {
          when(findItemsUseCase())
              .thenAnswer((_) async => const Success(items));
          bloc.add(OnFindItems());
        },
        expect: () {
          return const [
            ItemState(status: ItemStatus.loading, items: []),
            ItemState(status: ItemStatus.loaded, items: items)
          ];
        },
        wait: const Duration(seconds: 5),
        verify: (bloc) {
          verify(findItemsUseCase());
        });

    blocTest("Should emit ServerError when Server down",
        build: () => itemBloc,
        seed: () => initState,
        act: (ItemBloc bloc) {
          when(findItemsUseCase())
              .thenAnswer((_) async => Error(ServerFailure()));
          bloc.add(OnFindItems());
        },
        expect: () {
          return const [
            ItemState(status: ItemStatus.loading, items: []),
            ItemState(status: ItemStatus.serverError, items: [])
          ];
        },
        wait: const Duration(seconds: 5),
        verify: (bloc) {
          verify(findItemsUseCase());
        });

    blocTest("Should emit status: InternetError if no internet ",
        build: () => itemBloc,
        seed: () => initState,
        act: (ItemBloc bloc) {
          when(findItemsUseCase())
              .thenAnswer((_) async => Error(NetworkFailure()));
          bloc.add(OnFindItems());
        },
        expect: () {
          return const [
            ItemState(status: ItemStatus.loading, items: []),
            ItemState(status: ItemStatus.internetError, items: [])
          ];
        },
        wait: const Duration(seconds: 5),
        verify: (bloc) {
          verify(findItemsUseCase());
        });
  });
}
