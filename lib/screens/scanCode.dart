import 'dart:typed_data';
import 'dart:convert';
import 'package:napoli_smart/models/infoModel.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:napoli_smart/widgets/qrScannerOverlay.dart';

class ScanCode extends StatefulWidget {
  const ScanCode({super.key});

  @override
  State<ScanCode> createState() => _ScanCodeState();
}

class _ScanCodeState extends State<ScanCode> {
  MobileScannerController _cameraController = MobileScannerController();
  bool _torchState = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      appBar: AppBar(
        title: const Text(
          "🔍 Napoli Smart",
          style: TextStyle(color: Color.fromRGBO(0, 0, 128, 1)),
        ),
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: _cameraController,
            onDetect: (capture) {
              _cameraController.stop();
              DetectionSpeed.unrestricted;
              final List<Barcode> barcodes = capture.barcodes;
              if (barcodes.isNotEmpty) {
                final barcode =
                    barcodes.first; // Ottieni il primo barcode dalla lista
                final data = barcode.displayValue;
                if (data != null) {
                  try {
                    Map<String, dynamic> jsonData = jsonDecode(data);
                    print(data);
                    Information information = Information.fromJson(jsonData);
                    Navigator.popAndPushNamed(context, '/info',
                        arguments: information);
                  } catch (e) {
                    Navigator.pushNamed(context, '/error');
                  }
                }
              }
            },
          ),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _torchState = !_torchState;
            _cameraController.toggleTorch();
          });
        },
        child: Icon(
          _torchState ? Icons.flash_on : Icons.flash_off,
          color: _torchState ? Colors.yellow : Colors.grey,
        ),
      ),
    );
  }
}
