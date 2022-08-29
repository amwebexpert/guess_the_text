import 'dart:io' show Platform;

import 'package:barcode/barcode.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '/utils/extensions/string.extensions.dart';

class QrCodeService {
  static final QrCodeService _instance = QrCodeService._privateConstructor();

  factory QrCodeService() => _instance;

  QrCodeService._privateConstructor();

  bool isScanOperationSupported() => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  Future<String> scan({required String cancelLabel, String lineColor = '#ff6666', bool isShowFlashIcon = true}) async {
    final String data =
        await FlutterBarcodeScanner.scanBarcode(lineColor, cancelLabel, isShowFlashIcon, ScanMode.DEFAULT);

    return data.isBlank || data == '-1' ? '' : data;
  }

  String generateSvg({required String text, required int color, double size = 400}) {
    final Barcode qrCode = Barcode.qrCode();

    return qrCode.toSvg(text, width: size, height: size, color: color);
  }
}
