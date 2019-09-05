import 'package:app/components/Socials/socials_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class FeatureMixInfo extends StatelessWidget {
  final BehaviorSubject<FeatureMixCreatorDto> creatorInfo;
  final FeatureMixCreatorSimpleDto simple;
  const FeatureMixInfo({Key key, this.creatorInfo, this.simple})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          StreamBuilder<FeatureMixCreatorDto>(
            stream: creatorInfo,
            initialData: null,
            builder: (BuildContext context,
                AsyncSnapshot<FeatureMixCreatorDto> snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }

              return Container(
                child: Column(
                  children: <Widget>[
 AppBar(
        title: Hero(
            tag: "mix_brnad_${simple.name}",
            child: Text(simple.name)),
        centerTitle: true,
      ),
                    new Image(
                        image: new CachedNetworkImageProvider(
                            snapshot.data.logoPicture),
                        fit: BoxFit.cover,
                        height: 150),
                    Center(
                      child: Container(
                        child: SocialsList(
                          socials: snapshot.data.socialMedias,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
