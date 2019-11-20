import 'dart:io';

import 'package:app/app/app.dart';
import 'package:app/components/Media/media.widget.dart';
import 'package:app/pages/Common/upload_picture.page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class PlacePicturesPage extends StatelessWidget {
  final PlaceDto place;
  const PlacePicturesPage({Key key, this.place}) : super(key: key);

  void uploadPicture(File file){
      App.http
            .uploadPlacePicture(place.id, file,
            )
            .then((_) {
            
        });
        
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                settings: RouteSettings(),
                builder: (context) =>
                    UploadPicturePage(onFileUploaded: (file) => uploadPicture(file),)),
          ))
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: place.medias.length,
          itemBuilder: (context, index) {
            var item = place.medias[index];
            return Container(height: 400,child: MediaWidget(item,size: MediaSize.Large,));
          },
        ),
      ),
    );
  }
}
