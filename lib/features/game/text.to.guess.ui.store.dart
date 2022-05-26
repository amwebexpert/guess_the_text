import 'package:guess_the_text/store/store.state.enum.dart';
import 'package:guess_the_text/store/store.state.utils.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'text.to.guess.ui.store.g.dart';

// This is the class used by rest of the codebase
class TextToGuessUIStore extends TextToGuessUIStoreBase with _$TextToGuessUIStore {
  static final TextToGuessUIStore _instance = TextToGuessUIStore._privateConstructor();

  factory TextToGuessUIStore() => _instance;

  TextToGuessUIStore._privateConstructor() : super();
}

// The store-class
abstract class TextToGuessUIStoreBase with Store {
  @observable
  late ObservableFuture<void>? _shuffleFuture;

  @observable
  bool isShuffling = false;

  @action
  Future<void> shuffle({required int milliseconds}) async {
    _shuffleFuture = ObservableFuture(_shuffleDelay(milliseconds: milliseconds));
    await _shuffleFuture;
  }

  Future<void> _shuffleDelay({required int milliseconds}) async =>
      Future<void>.delayed(Duration(microseconds: milliseconds));

  @computed
  StoreState get state => fromFuture(_shuffleFuture?.status);
}
