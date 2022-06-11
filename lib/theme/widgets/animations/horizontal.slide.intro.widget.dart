import 'package:flutter/material.dart';

const welcomeImage = 'assets/images/hangman-happy.svg';

class HorizontalSlideIntroWidget extends StatefulWidget {
  final Widget child;
  final void Function()? onAnimationComplete;
  final Duration duration;
  final Offset offsetStart;
  final Offset offsetEnd;

  const HorizontalSlideIntroWidget(
      {Key? key,
      required this.child,
      this.onAnimationComplete,
      this.duration = const Duration(seconds: 2),
      this.offsetStart = const Offset(1, -0.25),
      this.offsetEnd = const Offset(0, 0)})
      : super(key: key);

  @override
  State<HorizontalSlideIntroWidget> createState() => _HorizontalSlideIntroWidgetState();
}

class _HorizontalSlideIntroWidgetState extends State<HorizontalSlideIntroWidget> with SingleTickerProviderStateMixin {
  late final AnimationController animController;
  late final Animation<Offset> slideAnim;

  @override
  void initState() {
    super.initState();

    animController = AnimationController(duration: widget.duration, vsync: this);
    animController.addListener(() {
      setState(() {});
    });

    slideAnim = Tween<Offset>(begin: widget.offsetStart, end: widget.offsetEnd)
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
