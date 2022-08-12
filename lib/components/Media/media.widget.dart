import 'package:app/app/app.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import 'media_full.dart';

class MediaWidget extends StatelessWidget {
  @required
  final MediaDto? media;
  final MediaSize size;
  final bool openOnClick;

  const MediaWidget(this.media, {Key? key, this.size = MediaSize.Large, this.openOnClick = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (openOnClick) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MediaFull(
                    media: media,
                  )));
        }
      },
      child: Container(
        child: CachedNetworkImage(
            fit: BoxFit.fitHeight,
            fadeOutDuration: Duration(milliseconds: 0),
            fadeInCurve: Curves.linear,
            placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl: 'https://${App.baseUri}${media!.path}${getSize(size)}'),
      ),
    );
  }

  static String getSize(MediaSize size) {
    switch (size) {
      case MediaSize.Small:
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
    return "original.jpg";
  }
}

enum MediaSize { Small, Medium, Large, ExtraLarge, Original }
