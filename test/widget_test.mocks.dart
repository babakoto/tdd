// Mocks generated by Mockito 5.1.0 from annotations
// in clean_tdd_bloc/test/widget_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:bloc/bloc.dart' as _i7;
import 'package:clean_tdd_bloc/domain/usecases/items/find_item_by_id_usecase.dart'
    as _i4;
import 'package:clean_tdd_bloc/domain/usecases/items/find_items_usecase.dart'
    as _i2;
import 'package:clean_tdd_bloc/presentation/blocs/items/item_bloc.dart' as _i3;
import 'package:clean_tdd_bloc/presentation/pages/detail/bloc/detail_bloc.dart'
    as _i5;
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

class _FakeFindItemsUseCase_0 extends _i1.Fake implements _i2.FindItemsUseCase {
}

class _FakeItemState_1 extends _i1.Fake implements _i3.ItemState {}

class _FakeFindItemByIdUseCase_2 extends _i1.Fake
    implements _i4.FindItemByIdUseCase {}

class _FakeDetailState_3 extends _i1.Fake implements _i5.DetailState {}

/// A class which mocks [ItemBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockItemBloc extends _i1.Mock implements _i3.ItemBloc {
  MockItemBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FindItemsUseCase get findItemsUseCase =>
      (super.noSuchMethod(Invocation.getter(#findItemsUseCase),
          returnValue: _FakeFindItemsUseCase_0()) as _i2.FindItemsUseCase);
  @override
  _i3.ItemState get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _FakeItemState_1()) as _i3.ItemState);
  @override
  _i6.Stream<_i3.ItemState> get stream => (super.noSuchMethod(
      Invocation.getter(#stream),
      returnValue: Stream<_i3.ItemState>.empty()) as _i6.Stream<_i3.ItemState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  void add(_i3.ItemEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i3.ItemEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  void emit(_i3.ItemState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void on<E extends _i3.ItemEvent>(_i7.EventHandler<E, _i3.ItemState>? handler,
          {_i7.EventTransformer<E>? transformer}) =>
      super.noSuchMethod(
          Invocation.method(#on, [handler], {#transformer: transformer}),
          returnValueForMissingStub: null);
  @override
  void onTransition(_i7.Transition<_i3.ItemEvent, _i3.ItemState>? transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i6.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  void onChange(_i7.Change<_i3.ItemState>? change) =>
      super.noSuchMethod(Invocation.method(#onChange, [change]),
          returnValueForMissingStub: null);
  @override
  void addError(Object? error, [StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#addError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void onError(Object? error, StackTrace? stackTrace) =>
      super.noSuchMethod(Invocation.method(#onError, [error, stackTrace]),
          returnValueForMissingStub: null);
}

/// A class which mocks [DetailBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockDetailBloc extends _i1.Mock implements _i5.DetailBloc {
  MockDetailBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.FindItemByIdUseCase get findItemById => (super.noSuchMethod(
      Invocation.getter(#findItemById),
      returnValue: _FakeFindItemByIdUseCase_2()) as _i4.FindItemByIdUseCase);
  @override
  _i5.DetailState get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _FakeDetailState_3()) as _i5.DetailState);
  @override
  _i6.Stream<_i5.DetailState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i5.DetailState>.empty())
          as _i6.Stream<_i5.DetailState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  void add(_i5.DetailEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i5.DetailEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  void emit(_i5.DetailState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void on<E extends _i5.DetailEvent>(
          _i7.EventHandler<E, _i5.DetailState>? handler,
          {_i7.EventTransformer<E>? transformer}) =>
      super.noSuchMethod(
          Invocation.method(#on, [handler], {#transformer: transformer}),
          returnValueForMissingStub: null);
  @override
  void onTransition(
          _i7.Transition<_i5.DetailEvent, _i5.DetailState>? transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i6.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  void onChange(_i7.Change<_i5.DetailState>? change) =>
      super.noSuchMethod(Invocation.method(#onChange, [change]),
          returnValueForMissingStub: null);
  @override
  void addError(Object? error, [StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#addError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void onError(Object? error, StackTrace? stackTrace) =>
      super.noSuchMethod(Invocation.method(#onError, [error, stackTrace]),
          returnValueForMissingStub: null);
}
