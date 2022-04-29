// Mocks generated by Mockito 5.1.0 from annotations
// in clean_tdd_bloc/test/unit-tests/presentation/pages/detail/bloc/detail_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:clean_tdd_bloc/core/error/failure.dart' as _i6;
import 'package:clean_tdd_bloc/core/generics/multi_result.dart' as _i3;
import 'package:clean_tdd_bloc/domain/domain.dart' as _i2;
import 'package:clean_tdd_bloc/domain/usecases/items/find_item_by_id_usecase.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeItemRepository_0 extends _i1.Fake implements _i2.ItemRepository {}

class _FakeResult_1<E, S> extends _i1.Fake implements _i3.Result<E, S> {}

/// A class which mocks [FindItemByIdUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFindItemByIdUseCase extends _i1.Mock
    implements _i4.FindItemByIdUseCase {
  MockFindItemByIdUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ItemRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeItemRepository_0()) as _i2.ItemRepository);
  @override
  _i5.Future<_i3.Result<_i6.Failure, _i2.ItemEntity>> call({int? param}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#param: param}),
          returnValue: Future<_i3.Result<_i6.Failure, _i2.ItemEntity>>.value(
              _FakeResult_1<_i6.Failure, _i2.ItemEntity>())) as _i5
          .Future<_i3.Result<_i6.Failure, _i2.ItemEntity>>);
}