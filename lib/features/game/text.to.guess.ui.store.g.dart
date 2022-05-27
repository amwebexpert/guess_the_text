// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text.to.guess.ui.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextToGuessUIStore on _TextToGuessUIStoreBase, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: '_TextToGuessUIStoreBase.state'))
          .value;

  late final _$_shuffleFutureAtom =
      Atom(name: '_TextToGuessUIStoreBase._shuffleFuture', context: context);

  @override
  ObservableFuture<bool>? get _shuffleFuture {
    _$_shuffleFutureAtom.reportRead();
    return super._shuffleFuture;
  }

  @override
  set _shuffleFuture(ObservableFuture<bool>? value) {
    _$_shuffleFutureAtom.reportWrite(value, super._shuffleFuture, () {
      super._shuffleFuture = value;
    });
  }

  late final _$shuffleAsyncAction =
      AsyncAction('_TextToGuessUIStoreBase.shuffle', context: context);

  @override
  Future<void> shuffle({required int milliseconds}) {
    return _$shuffleAsyncAction
        .run(() => super.shuffle(milliseconds: milliseconds));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
