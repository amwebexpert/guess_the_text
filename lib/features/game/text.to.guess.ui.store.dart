import 'package:guess_the_text/store/store.state.enum.dart';
import 'package:guess_the_text/store/store.state.utils.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'text.to.guess.ui.store.g.dart';

// This is the class used by rest of the codebase
class TextToGuessUIStore extends _TextToGuessUIStoreBase with _$TextToGuessUIStore {}

// The store-class
abstract class _TextToGuessUIStoreBase with Store {
  @observable
  ObservableFuture<bool>? _shuffleFuture;

  @action
  Future<void> shuffle({required int milliseconds}) async {
    _shuffleFuture = ObservableFuture(Future<bool>.delayed(Duration(milliseconds: milliseconds), () => true));
    await _shuffleFuture!;
  }

  @computed
  StoreState get state => fromFuture(_shuffleFuture?.status);
}
