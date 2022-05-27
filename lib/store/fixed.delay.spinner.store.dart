import 'package:guess_the_text/store/store.state.enum.dart';
import 'package:guess_the_text/store/store.state.utils.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'fixed.delay.spinner.store.g.dart';

// This is the class used by rest of the codebase
class FixedDelaySpinnerStore extends _FixedDelaySpinnerStoreBase with _$FixedDelaySpinnerStore {}

// The store-class
abstract class _FixedDelaySpinnerStoreBase with Store {
  @observable
  ObservableFuture<void>? _spinFuture;

  @action
  Future<void> spin({required int milliseconds}) async {
    final duration = Duration(milliseconds: milliseconds);
    _spinFuture = ObservableFuture(Future<void>.delayed(duration));
    await _spinFuture!;
  }

  @computed
  StoreState get state => fromFuture(_spinFuture?.status);

  @computed
  bool get isLoading => state == StoreState.loading;
}
