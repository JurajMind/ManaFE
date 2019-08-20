import 'package:app/app/app.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class MediaWidget extends StatelessWidget {
  @required
  final MediaDto media;
  final MediaSize size;

  const MediaWidget(this.media, {Key key, this.size = MediaSize.Large}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
          fit: BoxFit.fitHeight,
          fadeOutDuration: Duration(milliseconds: 0),
          fadeInCurve: Curves.linear,
          placeholder: (context, url) => CircularProgressIndicator(),
          imageUrl: 'https://${App.baseUri}${media.path}${getSize(size)}'),
    );
  }

  String getSize(MediaSize size){
    switch(size){
      case MediaSize.Small :
        return "180.jpg";
      case MediaSize.Medium:
      return "300.jpg";
        break;
      case MediaSize.Large:
    return "800.jpg";
      case MediaSize.ExtraLarge:
         return "1600.jpg";
      case MediaSize.Original:
         return "original.jpg";
        break;
    }

  }
}

enum MediaSize {
Small,Medium,Large,ExtraLarge,Original
}
