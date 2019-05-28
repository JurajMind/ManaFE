import 'package:flutter/material.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';

class QrCodeReaderPage extends StatefulWidget {
  @override
  _QrCodeReaderPageState createState() => _QrCodeReaderPageState();
}

class _QrCodeReaderPageState extends State<QrCodeReaderPage>
    with SingleTickerProviderStateMixin {
  List<CameraDescription> cameras;
  QRReaderController controller;
  AnimationController animationController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
     availableCameras().then((onValue) {cameras = onValue;
       onNewCameraSelected(cameras[0]);});
       
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 3),
    );

    animationController.addListener(() {
      this.setState(() {});
    });
    animationController.forward();
    verticalPosition = Tween<double>(begin: 0.0, end: 300.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear))
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          animationController.reverse();
        } else if (state == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });

    // pick the first available camera
  
  }

  Animation<double> verticalPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Qr reader'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Center(child: _cameraPreviewWidget()),
            ),
          )
        ],
      ),
    );
  }

  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'No camera selected',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return new AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: new QRReaderPreview(controller),
      );
    }
  }

    void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = new QRReaderController(cameraDescription, ResolutionPreset.low,
        [CodeFormat.qr, CodeFormat.pdf417], onCodeRead);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
   
      }
    });

    try {
      await controller.initialize();
    } on QRReaderException catch (e) {   
    }

    if (mounted) {
      setState(() {});
      controller.startScanning();
    }
  }
  
    void onCodeRead(dynamic value) {  
      print(value);
      Navigator.of(_scaffoldKey.currentContext).pop(value);
    // ... do something
    // wait 5 seconds then start scanning again.
    new Future.delayed(const Duration(seconds: 5), controller.startScanning);
  }

 
}
