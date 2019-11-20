import 'package:app/components/Socials/socials_widget.dart';
import 'package:app/support/m_platform.dart';
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
                      backgroundColor: Theme.of(context).backgroundColor,
                      elevation: 20,
                      title: Hero(
                          tag: "mix_brnad_${simple.name}",
                          child: Text(simple.name)),
                      centerTitle: true,
                    ),
                    !MPlatform.isWeb
                        ? new Image(
                            image: new CachedNetworkImageProvider(
                                snapshot.data.logoPicture),
                            fit: BoxFit.cover,
                            height: 150)
                        : Image.network(
                            snapshot.data.logoPicture,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
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
