import 'package:app/components/Places/open_indicator.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/Places/place_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({
    Key key,
    @required this.place,
  }) : super(key: key);

  final PlaceSimpleDto place;

  @override
  Widget build(BuildContext context) {
    var placeBloc = DataProvider.getData(context).placeSingleBloc;
    return ListTile(
      onTap: () {
        placeBloc.loadPlace(place: place);
        Navigator.of(context).push(MaterialPageRoute(
            settings: RouteSettings(),
            builder: (context) => PlaceDetailPage(place: place)));
      },
      leading: SizedBox(
          height: 60.0,
          width: 60.0,
          child: Hero(
            tag: '${place.friendlyUrl}_place',
            child: new Image(
              image: new CachedNetworkImageProvider(
                  Extensions.getPlaceImage(place)),
              fit: BoxFit.cover,
            ),
          )),
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(place.name),
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
