import 'package:app/theme/theme_widget.dart';
import 'package:flutter/material.dart';
//import 'package:qr_mobile_vision/qr_camera.dart';

class QrCodeReader extends StatefulWidget {
  @override
  _QrCodeReaderState createState() => _QrCodeReaderState();
}

class _QrCodeReaderState extends State<QrCodeReader> {
  @override
  Widget build(BuildContext context) {
    var theme = MTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR code', style: theme.appBarStyle),
      ),
      body: Container(
        child: Center(
          child:
              new SizedBox(width: 300.0, height: 300.0, child: Placeholder()),
        ),
      ),
    );
  }
}
