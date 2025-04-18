import 'package:app/components/Media/media.widget.dart';
import 'package:app/components/StarRating/star_ratting.dart';
import 'package:app/main.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/places/place_bloc.dart';
import 'package:app/pages/Places/Reservations/reservation_page.dart';
import 'package:app/pages/Places/menu.page.dart';
import 'package:app/pages/Places/place_extended_info.dart';
import 'package:app/pages/Places/place_pictures_page.dart';
import 'package:app/services/share.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app/support/m_platform.dart';

class PlaceDetailPage extends StatefulWidget {
  final PlaceSimpleDto? place;
  final PlaceBloc? placeBloc;
  final int? placeId;

  PlaceDetailPage({this.place, this.placeBloc, this.placeId});

  @override
  State<StatefulWidget> createState() {
    return new _PlaceDetailState(place, placeBloc);
  }
}

class _PlaceDetailState extends State<PlaceDetailPage> {
  PlaceSimpleDto? place;
  @override
  Future didChangeDependencies() async {
    super.didChangeDependencies();
    if (placeBloc == null) {
      placeBloc = placeBloc = getIt.get<PlaceBloc>();
    }
    if (this.place != null)
      placeBloc!.loadPlace(place: this.place);
    else {
      var newPlace = await placeBloc!.loadPlace(placeId: widget.placeId);
      setState(() {
        place = newPlace;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    place = widget.place;
  }

  final double _appBarHeight = 256.0;
  PlaceBloc? placeBloc;
  _PlaceDetailState(this.place, this.placeBloc);

  @override
  Widget build(BuildContext context) {
    if (place == null) {
      return Center(child: SizedBox(height: 60, width: 60, child: CircularProgressIndicator()));
    }

    return new Scaffold(
        body: new CustomScrollView(
      slivers: <Widget>[
        new SliverAppBar(
          backgroundColor: Colors.black,
          pinned: true,
          expandedHeight: _appBarHeight,
          bottom: PreferredSize(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(Extensions.adress(place!.address), style: Theme.of(context).textTheme.headline5),
                    new StarRating(
                      size: 25.0,
                      rating: 2.0,
                      starCount: 5,
                      color: Colors.white,
                      borderColor: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            preferredSize: Size(15.0, 15.0),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.share),
                onPressed: () async {
                  var url = await ShareService.placeShareLink(place!);
                  Share.share(url.toString());
                }),
            IconButton(
                icon: Icon(Icons.photo_size_select_small),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    settings: RouteSettings(),
                    builder: (context) => PlacePicturesPage(place: placeBloc!.placeInfo.value)))),
          ],
          flexibleSpace: new FlexibleSpaceBar(
            title: SizedBox(
              width: 250.0,
              child: Text(
                place!.name!,
                maxLines: 2,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                      shadows: [
                        Shadow(
                            // bottomLeft
                            offset: Offset(-1, -1),
                            color: Colors.black),
                        Shadow(
                            // bottomRight
                            offset: Offset(1, -1),
                            color: Colors.black),
                        Shadow(
                            // topRight
                            offset: Offset(1, 1),
                            color: Colors.black),
                        Shadow(
                            // topLeft
                            offset: Offset(-1, 1),
                            color: Colors.black),
                      ],
                    )),
              ),
            ),
            centerTitle: true,
            background: new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Hero(
                  tag: '${place!.friendlyUrl}_place',
                  child: new Image(
                    image: (MPlatform.isWeb
                            ? NetworkImage(Extensions.getPlaceImage(place, MediaSize.Large))
                            : new CachedNetworkImageProvider(Extensions.getPlaceImage(place, MediaSize.Large)))
                        as ImageProvider<Object>,
                    fit: BoxFit.cover,
                    height: _appBarHeight,
                  ),
                )
              ],
            ),
          ),
        ),
        new SliverList(
          delegate: new SliverChildListDelegate(<Widget>[
            Hero(
              tag: "${place!.friendlyUrl}_reservation",
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 800),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: new Column(
                        children: <Widget>[
                          Container(
                              height: MediaQuery.of(context).size.height,
                              child: PlaceExtendedInfo(
                                place: place,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            )
          ]),
        )
      ],
    ));
  }

  dispose() {
    super.dispose();
  }
}

class BookMenuWidget extends StatelessWidget {
  const BookMenuWidget({
    Key? key,
    required this.placeBloc,
    required this.place,
  }) : super(key: key);

  final PlaceBloc placeBloc;
  final PlaceSimpleDto? place;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(20.0)),
      child: buildMenu(context),
    );
  }

  Widget buildMenu(BuildContext context) {
    if (!(place!.haveReservation ?? false)) {
      if (!place!.haveMenu!)
        return Container(
            width: MediaQuery.of(context).size.width * 0.7, child: BookButton(place: place, placeBloc: placeBloc));
    }

    return new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(flex: 1, child: BookButton(placeBloc: placeBloc, place: place)),
        Container(
          height: 35.0,
          width: 2.0,
          color: Colors.grey,
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            child: Text(
              AppTranslations.of(context)!.text("place.menu").toUpperCase(),
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(settings: RouteSettings(), builder: (context) => MenuPage(place: place)));
            },
          ),
        )
      ],
    );
  }
}

class DisabledChip extends StatelessWidget {
  final IconData icon;
  final bool enable;
  const DisabledChip(
    this.icon,
    this.enable, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Chip(
        backgroundColor: enable ? Colors.blue : Colors.grey,
        label: Icon(
          icon,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

class IconUrlButton extends StatelessWidget {
  const IconUrlButton({Key? key, required this.url, this.icon, this.color = Colors.black}) : super(key: key);

  final String url;
  final IconData? icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: color, size: 40),
      onPressed: () {
        launch(url);
      },
    );
  }
}

class BookButton extends StatelessWidget {
  final PlaceBloc? placeBloc;
  final PlaceSimpleDto? place;
  const BookButton({Key? key, this.placeBloc, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (place!.haveReservation ?? false) {
      return TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.calendar_view_day,
                color: Colors.black,
              ),
              Text(
                AppTranslations.of(context)!.text("place.reserve").toUpperCase(),
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          onPressed: () => _openBookingDialog(context));
    }

    return Container();
  }

  void _openBookingDialog(BuildContext context) {
    placeBloc!.loadReservationInfo(DateTime.now());
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new ReservationPage(
            place: place,
          );
        },
        fullscreenDialog: true));
  }
}
