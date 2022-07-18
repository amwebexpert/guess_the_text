import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guess_the_text/utils/debouncer/modulo.debouncer.dart';
import 'package:vector_math/vector_math.dart' as vector_math;

const offsetMultiplicationFactor = 0.005;

class PerspectiveWrapperWidget extends StatefulWidget {
  final Widget frontWidget;
  final Widget backWidget;

  const PerspectiveWrapperWidget({Key? key, required this.frontWidget, required this.backWidget}) : super(key: key);

  @override
  State<PerspectiveWrapperWidget> createState() => _PerspectiveWrapperWidgetState();
}

class _PerspectiveWrapperWidgetState extends State<PerspectiveWrapperWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  final ModuloDebouncer _debouncer = ModuloDebouncer();
  Offset _offset = Offset.zero;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(duration: const Duration(seconds: 1), vsync: this);
  }

  Future<void> kickOffAnimation() async {
    if (!mounted) {
      return;
    }

    Animation<Offset> slideAnim = Tween<Offset>(begin: _offset, end: Offset.zero)
        .chain(CurveTween(curve: Curves.elasticOut))
        .animate(_animController);

    _animController.addListener(() {
      final isFront = isFaceFront(slideAnim.value.dx);
      setState(() {
        _offset = slideAnim.value;
        _isFront = isFront;
      });
    });

    await _animController.forward(from: 0);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  int convertDeltaToDegrees(double delta) =>
      vector_math.degrees(delta * offsetMultiplicationFactor).round().abs() % 360;

  bool isFaceFront(double delta) {
    final degrees = convertDeltaToDegrees(delta);
    return ((degrees >= 0 && degrees < 90) || (degrees >= 180 && degrees < 270));
  }

  void logRotation(DragUpdateDetails details) {
    if (!kDebugMode) {
      return;
    }

    _debouncer.run(() {
      Offset offset = _offset + details.delta;
      final x = convertDeltaToDegrees(offset.dx);
      final y = convertDeltaToDegrees(offset.dy);
      print('($x°, $y°)');
    });
  }

  void onPanUpdate(DragUpdateDetails details) {
    logRotation(details);

    setState(() {
      _offset += details.delta;
      _isFront = isFaceFront(_offset.dx) && isFaceFront(_offset.dy);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) // perspective
          ..rotateX(_offset.dy * offsetMultiplicationFactor)
          ..rotateY(_offset.dx * -offsetMultiplicationFactor),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          onPanUpdate: onPanUpdate,
          onPanEnd: (_) => kickOffAnimation(),
          child: _isFront ? widget.frontWidget : widget.backWidget,
        ));
  }
}
