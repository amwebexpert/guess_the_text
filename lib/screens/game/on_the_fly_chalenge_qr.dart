import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:barcode/barcode.dart';

class OnTheFlyChalengeQrWidget extends StatelessWidget {
  final Map<String, String> queryParameters;

  const OnTheFlyChalengeQrWidget({Key? key, required this.queryParameters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this.queryParameters);

    final MaterialColor color = Colors.red;
    final qrCode = Barcode.qrCode();
    final qrCodeImage = qrCode.toSvg('Hello World!', width: 200, height: 200, color: 0xffffff);

    return Center(
      child: SvgPicture.string(qrCodeImage),
    );
  }
}
