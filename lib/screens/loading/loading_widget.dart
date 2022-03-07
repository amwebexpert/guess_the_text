import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:guess_the_text/services/hangman_service.dart';

import 'animations.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  final HangmanService service = HangmanService();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await service.loadCategories();
    await service.loadData();

    Navigator.pushReplacementNamed(context, '/game', arguments: {'categories': service.categories});
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Lottie.asset(getAnimationPath()),
      );
}
