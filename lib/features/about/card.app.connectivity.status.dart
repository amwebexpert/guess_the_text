import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityStatusWidget extends StatefulWidget {
  const ConnectivityStatusWidget({Key? key}) : super(key: key);

  @override
  State<ConnectivityStatusWidget> createState() => _ConnectivityStatusWidgetState();
}

class _ConnectivityStatusWidgetState extends State<ConnectivityStatusWidget> {
  late StreamSubscription<ConnectivityResult> _subscription;
  ConnectivityResult? _connectivityResult;

  @override
  void initState() {
    super.initState();

    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        _connectivityResult = result;
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stasusText = _connectivityResult?.toString().split('.')[1] ?? '?';
    return Text(stasusText);
  }
}
