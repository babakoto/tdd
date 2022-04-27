import 'package:clean_tdd_bloc/core/generics/multi_result.dart';
import 'package:clean_tdd_bloc/domain/domain.dart';
import 'package:clean_tdd_bloc/domain/usecases/items/find_item_by_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'find_user_by_id_use_case_test.mocks.dart';

@GenerateMocks([ItemRepository])
void main() {
  late MockItemRepository repository;
  late FindItemByIdUseCase findItemByIdUseCase;

  setUp(() {
    repository = MockItemRepository();
    findItemByIdUseCase = FindItemByIdUseCase(repository: repository);
  });

  const tParam = 1;
  const tItemEntity = ItemEntity(id: tParam, name: "Nokia", price: 200);
  test('Should return ItemEntity from ItemRepository', () async {
    when(repository.findItemById(id: tParam))
        .thenAnswer((_) async => const Success(tItemEntity));

    final result = await findItemByIdUseCase(param: tParam);
    expect(result, const Success(tItemEntity));
  });
}
