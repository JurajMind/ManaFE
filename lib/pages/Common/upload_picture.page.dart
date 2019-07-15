import 'dart:io';

import 'package:app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum UploadType { Place, Gear, Review }

class UploadPicturePage extends StatefulWidget {
  final int uploadKey;
  final UploadType uploadType;
  const UploadPicturePage(this.uploadKey, this.uploadType, {Key key})
      : super(key: key);

  @override
  _UploadPicturePageState createState() => _UploadPicturePageState();
}

class _UploadPicturePageState extends State<UploadPicturePage> {
  File _image;
  bool _uploading = false;
  bool done = false;
  double uploadProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SizedBox(
          height: 55,
        ),
        appBar: AppBar(
          title: Text('Upload a photo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Photo',
                        style: new TextStyle(fontSize: 16, color: Colors.grey)),
                    SizedBox(height: 5),
                    _image == null
                        ? Text('No image selected.')
                        : Image.file(
                            _image,
                            fit: BoxFit.fitHeight,
                          ),
                  ],
                )),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.photo_library),
                        onPressed: () async {
                          var image = await ImagePicker.pickImage(
                              source: ImageSource.gallery);

                          setState(() {
                            _image = image;
                          });
                        },
                      )),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.camera_enhance),
                        onPressed: () async {
                          var image = await ImagePicker.pickImage(
                              source: ImageSource.camera);

                          setState(() {
                            _image = image;
                          });
                        },
                      ))
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text('Upload'),
            ),
            SizedBox(
              height: 55,
            )
          ],
        ));
  }

  void uploadFile() {
    setState(() {
      _uploading = true;
    });

    switch (widget.uploadType) {
      case UploadType.Place:
        App.http
            .uploadPlacePicture(widget.uploadKey, _image,
                progress: (p) => updateProgress(p))
            .then((_) {
          setState(() {
            _uploading = false;
            done = true;
          });
        });
        break;
      case UploadType.Gear:
        App.http.uploadGearPicture(widget.uploadKey, _image).then((_) {
          setState(() {
            _uploading = false;
            done = true;
          });
        });
        break;

      default:
        break;
    }
  }

  updateProgress(double progress) {
    setState(() {
      this.uploadProgress = progress;
    });
  }
}
