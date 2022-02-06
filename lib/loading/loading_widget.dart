import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as spinner;
import 'package:guess_the_text/services/hangman_service.dart';

class LoadingWidget extends StatefulWidget {
  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  HangmanService service = HangmanService.singleton;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await service.loadCategories();
    await service.loadData();

    Navigator.pushReplacementNamed(context, '/game',
        arguments: {'categories': service.categories});
  }

  @override
  Widget build(BuildContext context) => const Center(
        child: spinner.SpinKitWave(color: Colors.orange, size: 50)
    );
  }
