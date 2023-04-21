import 'package:app/components/Media/media.widget.dart';
import 'package:app/components/Places/open_indicator.dart';
import 'package:app/main.dart';
import 'package:app/models/extensions.dart';

import 'package:app/module/module.dart';
import 'package:app/pages/Places/place_detail_page.dart';
import 'package:app/support/m_platform.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:shimmer/shimmer.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({
    Key? key,
    required this.place,
  }) : super(key: key);

  final PlaceSimpleDto place;

  @override
  Widget build(BuildContext context) {
    var placeBloc = getIt.get<PlaceBloc>();
    return ListTile(
      onTap: () {
        placeBloc.loadPlace(place: place);
        Navigator.of(context)
            .push(MaterialPageRoute(settings: RouteSettings(), builder: (context) => PlaceDetailPage(place: place)));
      },
      leading: SizedBox(
          height: 60.0,
          width: 60.0,
          child: Hero(
            tag: '${place.friendlyUrl}_place',
            child: new Image(
              image: (MPlatform.isWeb
                  ? NetworkImage(Extensions.getPlaceImage(place, MediaSize.Small))
                  : new CachedNetworkImageProvider(Extensions.getPlaceImage(place, MediaSize.Small))) as ImageProvider<Object>,
              fit: BoxFit.cover,
            ),
          )),
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            place.name!,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          OpenIndicator(
            place: place,
            size: Size.fromRadius(10),
          ),
        ],
      ),
      subtitle: Text(Extensions.adress(place.address)),
    );
  }
}

class PlaceItemShimer extends StatelessWidget {
  const PlaceItemShimer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.white,
      child: ListTile(
        leading: SizedBox(
            height: 60.0,
            width: 60.0,
            child: Container(
              height: 60,
              width: 60,
              color: Colors.black,
            )),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 18,
              width: 100,
              color: Colors.black,
            ),
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            ),
          ],
        ),
        subtitle: Container(
          height: 15,
          width: 60,
          color: Colors.black,
        ),
      ),
    );
  }
}
