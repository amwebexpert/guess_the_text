import 'package:flutter/material.dart';

const welcomeImage = 'assets/images/hangman-happy.svg';

class ScalingIntroWidget extends StatefulWidget {
  final Widget child;
  final void Function()? onAnimationComplete;

  const ScalingIntroWidget({Key? key, required this.child, this.onAnimationComplete}) : super(key: key);

  @override
  State<ScalingIntroWidget> createState() => _ScalingIntroWidgetState();
}

class _ScalingIntroWidgetState extends State<ScalingIntroWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    _animController.addListener(() {
      setState(() {});
    });

    _scaleAnimation = TweenSequence(
      [
        TweenSequenceItem(tween: Tween<double>(begin: 0, end: 1.25), weight: 1.0),
        TweenSequenceItem(tween: Tween<double>(begin: 1.25, end: 1.0), weight: 1.0),
      ],
    ).animate(CurvedAnimation(parent: _animController, curve: const Interval(0, .75)));

    _fadeAnimation = Tween<double>(begin: 0, end: 1)
        .chain(CurveTween(curve: Curves.ease))
        .animate(CurvedAnimation(parent: _animController, curve: const Interval(0, 1)));

    Future.delayed(const Duration(milliseconds: 100), () => kickOffAnimation());
  }

  Future<void> kickOffAnimation() async {
    if (!mounted) {
      return;
    }

    await _animController.forward(from: 0);
    if (widget.onAnimationComplete != null) {
      widget.onAnimationComplete!();
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _fadeAnimation, child: ScaleTransition(scale: _scaleAnimation, child: widget.child));
  }
}
