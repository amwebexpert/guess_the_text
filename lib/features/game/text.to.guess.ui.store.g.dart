// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text.to.guess.ui.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TextToGuessUIStore on TextToGuessUIStoreBase, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: 'TextToGuessUIStoreBase.state'))
          .value;

  late final _$_shuffleFutureAtom =
      Atom(name: 'TextToGuessUIStoreBase._shuffleFuture', context: context);

  @override
  ObservableFuture<void>? get _shuffleFuture {
    _$_shuffleFutureAtom.reportRead();
    return super._shuffleFuture;
  }

  @override
  set _shuffleFuture(ObservableFuture<void>? value) {
    _$_shuffleFutureAtom.reportWrite(value, super._shuffleFuture, () {
      super._shuffleFuture = value;
    });
  }

  late final _$isShufflingAtom =
      Atom(name: 'TextToGuessUIStoreBase.isShuffling', context: context);

  @override
  bool get isShuffling {
    _$isShufflingAtom.reportRead();
    return super.isShuffling;
  }

  @override
  set isShuffling(bool value) {
    _$isShufflingAtom.reportWrite(value, super.isShuffling, () {
      super.isShuffling = value;
    });
  }

  late final _$shuffleAsyncAction =
      AsyncAction('TextToGuessUIStoreBase.shuffle', context: context);

  @override
  Future<void> shuffle({required int milliseconds}) {
    return _$shuffleAsyncAction
        .run(() => super.shuffle(milliseconds: milliseconds));
  }

  @override
  String toString() {
    return '''
isShuffling: ${isShuffling},
state: ${state}
    ''';
  }
}
