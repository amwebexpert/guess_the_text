import 'package:flutter/material.dart';

class FullScreenAssetBackground extends StatelessWidget {
  final Widget child;
  final String assetImagePath;

  const FullScreenAssetBackground({Key? key, required this.child, required this.assetImagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetImagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
