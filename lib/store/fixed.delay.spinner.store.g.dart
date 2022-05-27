// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixed.delay.spinner.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FixedDelaySpinnerStore on _FixedDelaySpinnerStoreBase, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: '_FixedDelaySpinnerStoreBase.state'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_FixedDelaySpinnerStoreBase.isLoading'))
          .value;

  late final _$_spinFutureAtom =
      Atom(name: '_FixedDelaySpinnerStoreBase._spinFuture', context: context);

  @override
  ObservableFuture<void>? get _spinFuture {
    _$_spinFutureAtom.reportRead();
    return super._spinFuture;
  }

  @override
  set _spinFuture(ObservableFuture<void>? value) {
    _$_spinFutureAtom.reportWrite(value, super._spinFuture, () {
      super._spinFuture = value;
    });
  }

  late final _$spinAsyncAction =
      AsyncAction('_FixedDelaySpinnerStoreBase.spin', context: context);

  @override
  Future<void> spin({required int milliseconds}) {
    return _$spinAsyncAction.run(() => super.spin(milliseconds: milliseconds));
  }

  @override
  String toString() {
    return '''
state: ${state},
isLoading: ${isLoading}
    ''';
  }
}
