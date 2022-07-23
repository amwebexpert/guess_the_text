import 'package:flutter/foundation.dart';

class ModuloDebouncer {
  int counter = 0;
  int modulo;

  ModuloDebouncer({this.modulo = 30});

  void run(VoidCallback action) {
    counter++;
    if (counter < modulo) {
      return;
    }

    action();
    counter = 0;
  }
}
