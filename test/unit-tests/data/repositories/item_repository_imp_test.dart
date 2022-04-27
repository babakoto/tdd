import 'package:clean_tdd_bloc/core/core.dart';
import 'package:clean_tdd_bloc/core/error/expections.dart';
import 'package:clean_tdd_bloc/core/generics/multi_result.dart';
import 'package:clean_tdd_bloc/data/models/item_model.dart';
import 'package:clean_tdd_bloc/data/repositories/item_repository_imp.dart';
import 'package:clean_tdd_bloc/data/sources/local/local_source.dart';
import 'package:clean_tdd_bloc/data/sources/network/network_source.dart';
import 'package:clean_tdd_bloc/data/sources/server/server_source.dart';
import 'package:clean_tdd_bloc/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'item_repository_imp_test.mocks.dart';

@GenerateMocks([LocalSource, ServerSource, NetworkSource])
void main() {
  late MockServerSource serverSource;
  late MockLocalSource localSource;
  late MockNetworkSource networkSource;
  late ItemRepositoryImp itemRepositoryImp;

  setUp(() {
    serverSource = MockServerSource();
    localSource = MockLocalSource();
    networkSource = MockNetworkSource();

    itemRepositoryImp = ItemRepositoryImp(
      serverSource: serverSource,
      localSource: localSource,
      networkSource: networkSource,
    );
  });

  const List<ItemEntity> tItems = [
    ItemEntity(
      id: 1,
      name: "mac",
      price: 100,
    ),
    ItemEntity(
      id: 2,
      name: "pc",
      price: 50,
    )
  ];

  const List<ItemModel> tItemsModel = [
    ItemModel(
      id: 1,
      name: "mac",
      price: 100,
    ),
    ItemModel(
      id: 2,
      name: "pc",
      price: 50,
    )
  ];

  const tParam = 1;
  const tItemModel = ItemModel(id: tParam, name: "Nokia", price: 200);

  group("ONLINE", () {
    setUp(() {
      when(networkSource.isOnline()).thenAnswer((_) async => true);
    });
    test("Get List<Items> from Server", () async {
      when(serverSource.findItems()).thenAnswer((_) async => tItemsModel);
      final result = await itemRepositoryImp.findItems();
      verify(networkSource.isOnline());
      expect(result, equals(const Success(tItemsModel)));
    });

    test("if server offline", () async {
      when(networkSource.isOnline()).thenAnswer((_) async => true);
      when(serverSource.findItems()).thenThrow(ServerException());
      final result = await itemRepositoryImp.findItems();
      verify(networkSource.isOnline());
      expect(result, equals(Error(ServerFailure())));
    });

    group("FindItemById", () {
      test("Should return Success<ItemEntity>", () async {
        when(serverSource.findItemById(id: tParam)).thenAnswer(
          (_) async => tItemModel,
        );
        final result = await itemRepositoryImp.findItemById(id: tParam);
        expect(result, const Success(tItemModel));
      });

      test("Should return ServerFailure", () async {
        when(serverSource.findItemById(id: tParam))
            .thenThrow(ServerException());
        final result = await itemRepositoryImp.findItemById(id: tParam);
        expect(result, Error(ServerFailure()));
      });

      test("Should return NotFoundFailure", () async {
        when(serverSource.findItemById(id: tParam))
            .thenThrow(NotFoundException());
        final result = await itemRepositoryImp.findItemById(id: tParam);
        expect(result, Error(NotFoundFailure()));
      });
    });
  });

  group("OFFLINE", () {
    test("Should return NetworkFailure", () async {
      when(networkSource.isOnline()).thenAnswer((_) async => false);
      final result = await itemRepositoryImp.findItems();
      expect(result, Error(NetworkFailure()));
    });
  });
}
