import 'package:flutter/material.dart';
import 'package:guess_the_text/features/game/text_to_guess/text.to.guess.model.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/store/fixed.delay.spinner.store.dart';
import 'package:guess_the_text/store/store.state.enum.dart';
import 'package:mobx/mobx.dart';

import 'letter.widget.dart';

class LettersWidget extends StatefulWidget {
  static const List<String> letters = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
    ' ',
    '-',
  ];

  final Future<void> Function(String c) onLetterPressed;
  final TextToGuess textToGuess;

  const LettersWidget({Key? key, required this.textToGuess, required this.onLetterPressed}) : super(key: key);

  @override
  State<LettersWidget> createState() => _LettersWidgetState();
}

class _LettersWidgetState extends State<LettersWidget> with SingleTickerProviderStateMixin {
  final FixedDelaySpinnerStore _spinnerStore = serviceLocator.get();
  late final AnimationController _animController;
  late final Animation<double> _rotationAnim;

  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    super.initState();

    // prepare animation
    _animController = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this);
    _animController.addListener(() {
      setState(() {});
    });

    _rotationAnim = Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.ease)).animate(_animController);

    // link animation to spinnerStore state change
    final ReactionDisposer disposer = reaction((_) => _spinnerStore.state, (StoreState storeState) {
      if (storeState == StoreState.loading) {
        _animController.reverse(from: 1);
      }
    });
    _disposers.add(disposer);

    // start animation once the initial state is loaded
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _animController.reverse(from: 1);
      }
    });
  }

  @override
  void dispose() {
    _animController.dispose();

    for (var disposer in _disposers) {
      disposer();
    }

    super.dispose();
  }

  void onPressed(String c) {
    widget.onLetterPressed(c);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      spacing: 1,
      runSpacing: 1,
      children: LettersWidget.letters
          .map(
            (c) => RotationTransition(
                turns: _rotationAnim,
                alignment: Alignment.centerLeft,
                child: LetterWidget(
                    letter: c, isButtonEnable: !widget.textToGuess.isCharTried(c), onLetterPressed: onPressed)),
          )
          .toList(),
    );
  }
}
