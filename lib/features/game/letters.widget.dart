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
  final FixedDelaySpinnerStore spinnerStore = serviceLocator.get();
  late final AnimationController animController;
  late final Animation<double> rotationAnim;

  final List<ReactionDisposer> disposers = [];

  @override
  void initState() {
    super.initState();

    // prepare animation
    animController = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this);
    animController.addListener(() {
      setState(() {});
    });

    rotationAnim = Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.ease)).animate(animController);

    // link animation to spinnerStore state change
    final ReactionDisposer disposer = reaction((_) => spinnerStore.state, (StoreState storeState) {
      if (storeState == StoreState.loading) {
        animController.reverse(from: 1);
      }
    });
    disposers.add(disposer);

    // start animation once the initial state is loaded
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        animController.reverse(from: 1);
      }
    });
  }

  @override
  void dispose() {
    animController.dispose();

    for (var disposer in disposers) {
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
                turns: rotationAnim,
                alignment: Alignment.centerLeft,
                child: LetterWidget(
                    letter: c, isButtonEnable: !widget.textToGuess.isCharTried(c), onLetterPressed: onPressed)),
          )
          .toList(),
    );
  }
}
