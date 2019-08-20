import 'dart:io';

import 'package:app/app/app.dart';
import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum UploadType { Place, Gear, Review }

typedef void FileUploaded(File file);

class UploadPicturePage extends StatefulWidget {
  final FileUploaded onFileUploaded;

  const UploadPicturePage({Key key, this.onFileUploaded}) : super(key: key);

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
          title: Text('Upload photo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 5),
                    Center(
                      child: Container(
                        width: 300,
                        height: 300,
                        child: _image == null
                            ? Center(child: Text('No image selected.'))
                            : Container(
                               height: 280,
                                child: Image.file(
                                  _image,
                                  fit: BoxFit.fitHeight,
                                )),
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(16.0)),
                        child: IconButton(
                          icon: Icon(Icons.photo_library),
                          onPressed: () async {
                            var image = await ImagePicker.pickImage(
                                source: ImageSource.gallery);

                            setState(() {
                              _image = image;
                            });
                          },
                        ),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(16.0)),
                        child: IconButton(
                          icon: Icon(Icons.camera_enhance),
                          onPressed: () async {
                            var image = await ImagePicker.pickImage(
                                maxHeight: 1600,
                                imageQuality: 50,
                                source: ImageSource.camera);

                            setState(() {
                              _image = image;
                            });
                          },
                        ),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            MButton(
              onPressed: () => uploadFile(),
              label: 'Use this photo',
              icon: Icons.add_photo_alternate,
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

    widget.onFileUploaded(this._image);
    Navigator.of(context).pop();
  }

  updateProgress(double progress) {
    setState(() {
      this.uploadProgress = progress;
    });
  }
}
