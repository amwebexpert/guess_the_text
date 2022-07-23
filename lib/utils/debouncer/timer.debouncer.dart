import 'dart:async';
import 'package:flutter/foundation.dart';

class TimerDebouncer {
  late Duration _duration;
  Timer? _timer;

  TimerDebouncer({int milliseconds = 100}) {
    _duration = Duration(milliseconds: milliseconds);
  }

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(_duration, action);
  }
}
