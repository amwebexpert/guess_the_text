import 'package:flutter/material.dart';

const welcomeImage = 'assets/images/hangman-happy.svg';

class SlideIntroWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback? onAnimationComplete;
  final Duration duration;
  final Offset offsetStart;
  final Offset offsetEnd;

  const SlideIntroWidget(
      {Key? key,
      required this.child,
      this.onAnimationComplete,
      this.duration = const Duration(seconds: 2),
      this.offsetStart = const Offset(-1, -0.25),
      this.offsetEnd = const Offset(0, 0)})
      : super(key: key);

  @override
  State<SlideIntroWidget> createState() => _SlideIntroWidgetState();
}

class _SlideIntroWidgetState extends State<SlideIntroWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(duration: widget.duration, vsync: this);
    _animController.addListener(() {
      setState(() {});
    });

    _slideAnim = Tween<Offset>(begin: widget.offsetStart, end: widget.offsetEnd)
        .chain(CurveTween(curve: Curves.ease))
        .animate(_animController);

    Future.delayed(const Duration(milliseconds: 300), () => kickOffAnimation());
  }

  Future<void> kickOffAnimation() async {
    if (!mounted) {
      return;
    }

    await _animController.forward(from: 0);
    widget.onAnimationComplete?.call();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _slideAnim, child: widget.child);
  }
}
