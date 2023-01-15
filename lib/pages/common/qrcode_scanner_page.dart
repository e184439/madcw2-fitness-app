import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrcodeScannerPage extends StatelessWidget {
  const QrcodeScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
        allowDuplicates: false,
        onDetect: (barcode, args) {
          if (barcode.rawValue == null) {
            debugPrint('Failed to scan Barcode');
          } else {
            final String code = barcode.rawValue!;
            debugPrint('Barcode found! $code');
          }
        });
  }
}
