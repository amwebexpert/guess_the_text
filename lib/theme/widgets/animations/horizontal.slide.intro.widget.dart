import 'package:flutter/material.dart';

const welcomeImage = 'assets/images/hangman-happy.svg';

class HorizontalSlideIntroWidget extends StatefulWidget {
  final Widget child;
  final void Function()? onAnimationComplete;

  const HorizontalSlideIntroWidget({Key? key, required this.child, this.onAnimationComplete}) : super(key: key);

  @override
  State<HorizontalSlideIntroWidget> createState() => _HorizontalSlideIntroWidgetState();
}

class _HorizontalSlideIntroWidgetState extends State<HorizontalSlideIntroWidget> with SingleTickerProviderStateMixin {
  late final AnimationController animController;
  late final Animation<Offset> slideAnim;

  @override
  void initState() {
    super.initState();

    animController = AnimationController(duration: const Duration(milliseconds: 4000), vsync: this);
    animController.addListener(() {
      setState(() {});
    });

    slideAnim = Tween<Offset>(begin: const Offset(1, -0.25), end: const Offset(0, 0))
        .chain(CurveTween(curve: Curves.ease))
        .animate(animController);

    Future.delayed(const Duration(milliseconds: 300), () {
      animController.forward(from: 0).then((value) => {
            if (widget.onAnimationComplete != null) {widget.onAnimationComplete!()}
          });
    });
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: slideAnim, child: widget.child);
  }
}
