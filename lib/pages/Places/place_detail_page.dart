import 'package:app/components/Common/leading_icon.dart';
import 'package:app/components/Places/navigate_button.dart';
import 'package:app/components/Places/open_dropdown.dart';
import 'package:app/components/Places/place_detail.dart';
import 'package:app/components/Places/place_map.dart';
import 'package:app/components/Places/taxi_button.dart';
import 'package:app/components/StarRating/star_ratting.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/places/place_bloc.dart';
import 'package:app/pages/Places/Reservations/reservation_page.dart';
import 'package:app/pages/Places/menu.page.dart';
import 'package:app/support/mana_icons_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaceDetailPage extends StatefulWidget {
  final PlaceSimpleDto place;
  final PlaceBloc placeBloc;

  PlaceDetailPage({this.place, this.placeBloc});

  @override
  State<StatefulWidget> createState() {
    return new _PlaceDetailState(place, placeBloc);
  }
}

class _PlaceDetailState extends State<PlaceDetailPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (placeBloc == null) {
      placeBloc = DataProvider.getData(context).placeSingleBloc;
    }
    placeBloc.loadPlace(place: this.place);
  }

  @override
  void initState() {
    super.initState();
  }

  final double _appBarHeight = 256.0;
  final PlaceSimpleDto place;
  PlaceBloc placeBloc;
  _PlaceDetailState(this.place, this.placeBloc);

  @override
  Widget build(BuildContext context) {
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
                    Text(
                      Extensions.adress(place.address),
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    new StarRating(
                      size: 15.0,
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
              icon: Icon(Icons.photo_size_select_small),
            ),
          ],
          flexibleSpace: new FlexibleSpaceBar(
            title: SizedBox(
              width: 250.0,
              child: Text(
                place.name,
                maxLines: 2,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.display1.merge(TextStyle(
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
                  tag: '${place.friendlyUrl}_place',
                  child: new Image(
                    image: new CachedNetworkImageProvider(
                        Extensions.getPlaceImage(place)),
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
              tag: "${widget.place.friendlyUrl}_reservation",
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: new Column(
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: PlaceInfo(place: widget.place),
                              ),
                              flex: 1,
                            ),
                            Expanded(
                                flex: 1,
                                child: PlaceMap(
                                  place: place,
                                ))
                          ],
                        ),
                        StreamBuilder<PlaceDto>(
                            stream: placeBloc.placeInfo,
                            builder: (context, snapshot) {
                              return snapshot.data == null
                                  ? Container()
                                  : Column(children: [
                                      Wrap(
                                        children: <Widget>[
                                          new DisabledChip(ManaIcons.manam,
                                              snapshot.data.haveMana),
                                          new DisabledChip(
                                              FontAwesomeIcons.columns,
                                              snapshot.data.haveMenu),
                                          new DisabledChip(
                                              FontAwesomeIcons.calendarAlt,
                                              snapshot.data.haveReservation),
                                        ],
                                      ),
                                      Wrap(
                                        children: snapshot.data.flags
                                            .map((f) => new PlaceFlag(f))
                                            .toList(),
                                      )
                                    ]);
                            }),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              NavigateButton(
                                place: place,
                              ),
                              Container(
                                height: 14.0,
                                width: 2.0,
                                color: Colors.grey,
                              ),
                              TaxiButton(
                                place: place,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                          child: new BookMenuWidget(
                              placeBloc: placeBloc,
                              place: place,
                              widget: widget),
                        )
                      ],
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

  void _launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class BookMenuWidget extends StatelessWidget {
  const BookMenuWidget({
    Key key,
    @required this.placeBloc,
    @required this.place,
    @required this.widget,
  }) : super(key: key);

  final PlaceBloc placeBloc;
  final PlaceSimpleDto place;
  final PlaceDetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(20.0)),
      child: buildMenu(context),
    );
  }

  Widget buildMenu(BuildContext context) {
    if (!(place.haveReservation ?? false)) {
      if (!place.haveMenu)
        return Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: BookButton(place: place, placeBloc: placeBloc));
    }

    return new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
            flex: 1, child: BookButton(placeBloc: placeBloc, place: place)),
        Container(
          height: 35.0,
          width: 2.0,
          color: Colors.grey,
        ),
        Expanded(
          flex: 1,
          child: FlatButton(
            child: Text(
              'MENU',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  settings: RouteSettings(),
                  builder: (context) => MenuPage(place: widget.place)));
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
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Chip(
        backgroundColor: enable ?? false ? Colors.blue : Colors.grey,
        label: Icon(
          icon,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

class PlaceFlag extends StatelessWidget {
  final String flag;
  const PlaceFlag(
    this.flag, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Tooltip(
        child: Chip(
          label: flagToIcon(context),
        ),
        message: "Place have ${flag.toLowerCase()}",
      ),
    );
  }

  Widget flagToIcon(BuildContext context) {
    switch (flag) {
      case "CARD":
        return Icon(Icons.credit_card);
        break;
      case "WIFI":
        return Icon(Icons.wifi);
        break;
      case "CASH":
        return Icon(Icons.attach_money);
        break;
      case "PET":
        return Icon(Icons.pets);
        break;
      case "FOOD":
        return Icon(FontAwesomeIcons.utensils);
        break;
      default:
        return Text(
          flag,
          style: Theme.of(context).textTheme.body1.apply(color: Colors.black),
        );
    }
  }
}

class IconUrlButton extends StatelessWidget {
  const IconUrlButton(
      {Key key, @required this.url, this.icon, this.color = Colors.black})
      : super(key: key);

  final String url;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: color, size: 40),
      onPressed: () {
        if (url != null) {
          launch(url);
        }
      },
    );
  }
}

class BookButton extends StatelessWidget {
  final PlaceBloc placeBloc;
  final PlaceSimpleDto place;
  const BookButton({Key key, this.placeBloc, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!(place.haveReservation ?? false) && place.phoneNumber != null)
      return FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.phone,
                color: Colors.black,
              ),
              Text(
                'CALL FOR  RESERVATION',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          onPressed: () => launch('tel://${place.phoneNumber}'));

    if (place.haveReservation ?? false) {
      return FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.calendar_view_day,
                color: Colors.black,
              ),
              Text(
                'RESERVE',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          onPressed: () => _openBookingDialog(context));
    }

    return Container();
  }

  void _openBookingDialog(BuildContext context) {
    placeBloc.loadReservationInfo(DateTime.now());
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new ReservationPage(
            place: place,
          );
        },
        fullscreenDialog: true));
  }
}
