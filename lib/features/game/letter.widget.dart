import 'package:flutter/material.dart';

class LetterWidget extends StatefulWidget {
  final void Function(String c) onLetterPressed;
  final String letter;
  final bool isButtonEnable;

  const LetterWidget({Key? key, required this.letter, required this.isButtonEnable, required this.onLetterPressed})
      : super(key: key);

  @override
  State<LetterWidget> createState() => _LetterWidgetState();
}

class _LetterWidgetState extends State<LetterWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _rotationAnim;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _animController.addListener(() {
      setState(() {});
    });

    _rotationAnim = Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.ease)).animate(_animController);

    _scaleAnimation = TweenSequence(
      [
        TweenSequenceItem(tween: Tween<double>(begin: 1, end: 2), weight: 1.0),
        TweenSequenceItem(tween: Tween<double>(begin: 2, end: 1.0), weight: 1.0),
      ],
    ).animate(CurvedAnimation(parent: _animController, curve: const Interval(0, .75)));
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future<void> onPressed() async {
    await _animController.forward(from: 0);
    widget.onLetterPressed(widget.letter);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: RotationTransition(
        turns: _rotationAnim,
        child: ElevatedButton(
          key: Key('button_${widget.letter}'),
          onPressed: widget.isButtonEnable ? () => onPressed() : null,
          child: Text(
            widget.letter,
            style: Theme.of(context).textTheme.bodyText1?.apply(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
