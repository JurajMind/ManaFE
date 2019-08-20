import 'package:app/components/Media/media.widget.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class MediaFull extends StatelessWidget {
  final MediaDto media;

  const MediaFull({Key key, this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: MediaWidget(media,size: MediaSize.Large,)
      ),
    );
  }
}