import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as spinner;

class WordSessionTextLoading extends StatelessWidget {
  const WordSessionTextLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 18, 0, 10),
      child: spinner.SpinKitWave(color: Colors.orange, size: 30),
    );
  }
}
