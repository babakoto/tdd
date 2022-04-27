import 'package:clean_tdd_bloc/core/generics/multi_result.dart';
import 'package:clean_tdd_bloc/domain/domain.dart';
import 'package:clean_tdd_bloc/domain/usecases/items/find_items_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'find_items_use_case_test.mocks.dart';

@GenerateMocks([ItemRepository])
void main() {
  ///ARRANGE
  late MockItemRepository mockItemRepository;
  late FindItemsUseCase findItemsUseCase;

  setUp(() {
    mockItemRepository = MockItemRepository();
    findItemsUseCase = FindItemsUseCase(repository: mockItemRepository);
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

  test("should be return data from repository ", () async {
    when(mockItemRepository.findItems()).thenAnswer(
      (_) async => const Success(
        tItems,
      ),
    );

    // ACTION
    final result = await findItemsUseCase();

    // Assert
    expect(result, Success(tItems));
  });
}
