import '/store/store.state.enum.dart';
import '/store/store.state.utils.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'fixed.delay.spinner.store.g.dart';

// This is the class used by rest of the codebase
class FixedDelaySpinnerStore extends _FixedDelaySpinnerStoreBase with _$FixedDelaySpinnerStore {}

// The store-class
abstract class _FixedDelaySpinnerStoreBase with Store {
  @observable
  ObservableFuture<void>? _spinObservableFuture;

  @action
  Future<void> spin({required int milliseconds}) async {
    final duration = Duration(milliseconds: milliseconds);
    Future<void> spinFuture = Future.delayed(duration);
    _spinObservableFuture = ObservableFuture(spinFuture);

    await _spinObservableFuture!;
  }

  @computed
  StoreState get state => fromFuture(_spinObservableFuture?.status);

  @computed
  bool get isLoading => state == StoreState.loading;
}
