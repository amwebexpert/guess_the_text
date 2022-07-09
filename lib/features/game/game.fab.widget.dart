import 'package:flutter/material.dart';

class GameFabWidget extends StatefulWidget {
  final VoidCallback onPressed;

  const GameFabWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<GameFabWidget> createState() => _GameFabWidgetState();
}

class _GameFabWidgetState extends State<GameFabWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _rotationAnim;
  late final Animation<double> _fadingAnim;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);

    _rotationAnim = Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.ease)).animate(_animController);
    _fadingAnim = TweenSequence(
      [
        TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 0.5), weight: 1.0),
        TweenSequenceItem(tween: Tween<double>(begin: 0.5, end: 1.0), weight: 1.0),
      ],
    ).animate(_animController);

    _animController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void onPressed() {
    _animController.forward(from: 0);
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Shuffle', // TODO translate me i18n
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(_fadingAnim.value),
      child: RotationTransition(turns: _rotationAnim, child: const Icon(Icons.refresh)),
    );
  }
}
