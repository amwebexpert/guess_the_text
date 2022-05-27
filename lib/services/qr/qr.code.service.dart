import 'package:barcode/barcode.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:guess_the_text/utils/extensions/string.extensions.dart';

class QrCodeService {
  static final QrCodeService _instance = QrCodeService._privateConstructor();

  factory QrCodeService() => _instance;

  QrCodeService._privateConstructor();

  Future<String> scanQR({required String cancelLabel}) async {
    const lineColor = '#ff6666';
    const isShowFlashIcon = true;

    final String jsonChallenge =
        await FlutterBarcodeScanner.scanBarcode(lineColor, cancelLabel, isShowFlashIcon, ScanMode.DEFAULT);

    return jsonChallenge.isBlank ? '' : jsonChallenge;
  }

  String generateSvgQrCode({required String text, required int color, double size = 400}) {
    final Barcode qrCode = Barcode.qrCode();

    return qrCode.toSvg(text, width: size, height: size, color: color);
  }
}
