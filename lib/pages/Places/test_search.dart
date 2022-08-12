import 'dart:io';

import 'package:app/app/app.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

var kGoogleApiKey = "AIzaSyDv2o2BsQ1IJjdPS3eSjkf7f-_Jt7Fu-MU";

class TestSearch extends StatefulWidget {
  @override
  _TestSearchState createState() => _TestSearchState();
}

final homeScaffoldKey = GlobalKey<ScaffoldState>();
final searchScaffoldKey = GlobalKey<ScaffoldState>();

class _TestSearchState extends State<TestSearch> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Photo',
                          style:
                              new TextStyle(fontSize: 16, color: Colors.grey)),
                      SizedBox(height: 5),
                      _image == null
                          ? Text('No image selected.')
                          : Image.file(_image!),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.photo_library),
                    onPressed: () async {
                      var image = await ImagePicker()
                          .getImage(source: ImageSource.gallery);

                      setState(() {
                        _image = File(image!.path);
                      });
                    },
                  )),
              Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.camera_enhance),
                    onPressed: () async {
                      var image = await ImagePicker()
                          .getImage(source: ImageSource.camera);

                      setState(() {
                        _image = File(image!.path);
                      });
                    },
                  ))
            ],
          ),
          MaterialButton(
            onPressed: () {
              App.http!.uploadPlacePicture(1, _image!);
            },
            child: Text('upload'),
          )
        ],
      )),
    );
  }
}
