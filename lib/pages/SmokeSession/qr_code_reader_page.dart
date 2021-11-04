import 'dart:async';
import 'dart:io';

import 'package:app/theme/theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeReader extends StatefulWidget {
  @override
  _QrCodeReaderState createState() => _QrCodeReaderState();
}

class _QrCodeReaderState extends State<QrCodeReader> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
  StreamSubscription<Barcode> _subscription;

  @override
  Widget build(BuildContext context) {
    var theme = MTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR code', style: theme.appBarStyle),
      ),
      body: Container(
        child: Center(
          child: Stack(
            children: [
              buildQrView(context),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Double click controll button \n on stand to show qr code',
                        style: Theme.of(context).textTheme.headline6,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    if ((Platform.isIOS || Platform.isAndroid)) {
      return QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 300,
        ),
      );
    } else {
      return Placeholder();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    _subscription = controller.scannedDataStream.listen((scanData) {
      setState(() {
        Navigator.of(context).maybePop(scanData.code);
        controller.dispose();
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    controller.dispose();
    super.dispose();
  }
}
