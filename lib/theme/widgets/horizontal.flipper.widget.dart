import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guess_the_text/utils/debouncer/modulo.debouncer.dart';
import 'package:vector_math/vector_math.dart' as vector_math;

const offsetMultiplicationFactor = 0.005;
const offsetMultiplicationFactorY = 0.0003;
final delta180deg = vector_math.radians(180) / offsetMultiplicationFactor;

class HorizontalFlipper extends StatefulWidget {
  final Widget frontWidget;
  final Widget backWidget;

  const HorizontalFlipper({Key? key, required this.frontWidget, required this.backWidget}) : super(key: key);

  @override
  State<HorizontalFlipper> createState() => _HorizontalFlipperState();
}

class _HorizontalFlipperState extends State<HorizontalFlipper> with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  final ModuloDebouncer _debouncer = ModuloDebouncer();

  Widget? _frontWidget;
  Widget? _backWidget;
  Widget? _currentVisibleWidget;
  Offset _offset = Offset.zero;

  @override
  void initState() {
    super.initState();

    _frontWidget = widget.frontWidget;
    _backWidget = widget.backWidget;
    _currentVisibleWidget = _frontWidget;

    _animController = AnimationController(duration: const Duration(milliseconds: 700), vsync: this);
  }

  Future<void> kickOffAnimation() async {
    if (!mounted || _animController.isAnimating) {
      return;
    }

    final Offset end =
        _currentVisibleWidget == _frontWidget ? Offset.zero : Offset(_offset.dx > 0 ? delta180deg : -delta180deg, 0);

    Animation<Offset> slideAnim =
        Tween<Offset>(begin: _offset, end: end).chain(CurveTween(curve: Curves.elasticOut)).animate(_animController);

    _animController.addListener(() {
      setState(() {
        _offset = slideAnim.value;
        _currentVisibleWidget = isShowingStartFace(slideAnim.value.dx) ? _frontWidget : _backWidget;
      });
    });

    await _animController.forward(from: 0).then((value) {
      setState(() {
        _frontWidget = _currentVisibleWidget;
        _backWidget = _currentVisibleWidget == widget.frontWidget ? widget.backWidget : widget.frontWidget;
        _offset = Offset.zero;
      });
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  int convertDeltaToDegrees(double delta) => vector_math.degrees(delta * offsetMultiplicationFactor).round() % 360;

  bool isShowingStartFace(double delta) {
    final degrees = convertDeltaToDegrees(delta);
    return (degrees < 90 || degrees >= 270);
  }

  void logRotation(DragUpdateDetails details) {
    if (!kDebugMode) {
      return;
    }

    _debouncer.run(() {
      Offset offset = _offset + details.delta;
      final x = convertDeltaToDegrees(offset.dx);
      print('rotation: $x°');
    });
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (_animController.isAnimating) {
      return;
    }

    logRotation(details);

    setState(() {
      _offset += details.delta;
      _currentVisibleWidget = isShowingStartFace(_offset.dx) ? _frontWidget : _backWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) // perspective
          ..rotateX(_offset.dy * offsetMultiplicationFactorY)
          ..rotateY(_offset.dx * -offsetMultiplicationFactor),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          onPanUpdate: onPanUpdate,
          onPanEnd: (_) => kickOffAnimation(),
          child: isShowingStartFace(_offset.dx)
              ? _currentVisibleWidget
              : Transform.scale(scaleX: -1, child: _currentVisibleWidget), // mirror effect
        ));
  }
}
