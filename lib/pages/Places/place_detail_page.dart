import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/components/Common/leading_icon.dart';
import 'package:app/components/Places/open_dropdown.dart';
import 'package:app/components/Places/place_detail.dart';
import 'package:app/components/Places/place_map.dart';
import 'package:app/components/StarRating/star_ratting.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/places/place_bloc.dart';
import 'package:app/pages/Places/Reservations/reservation_page.dart';
import 'package:app/pages/Places/menu.page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:openapi/api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PlaceDetailPage extends StatefulWidget {
  final PlaceSimpleDto place;
  final PlaceBloc placeBloc;

  PlaceDetailPage({this.place, this.placeBloc});

  @override
  State<StatefulWidget> createState() {
    return new _PlaceDetailState(place, placeBloc);
  }
}

class _PlaceDetailState extends State<PlaceDetailPage>
    with TickerProviderStateMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (placeBloc == null) {
      placeBloc = DataProvider.getData(context).placeSingleBloc;
      placeBloc.loadPlace(place: this.place);
    }
  }

  @override
  void initState() {
    super.initState();
    buttonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);
    buttomZoomOut = new Tween(
      begin: 70.0,
      end: 400.0,
    ).animate(
      new CurvedAnimation(
        parent: buttonController,
        curve: new Interval(
          0.500,
          0.800,
          curve: Curves.ease,
        ),
      ),
    );
    buttomZoomOut.addListener(() {
      setState(() {});
    });
  }

  Future<Null> _playAnimation() async {
    try {
      await buttonController.forward();
      await buttonController.reverse();
    } on TickerCanceled {}
  }

  final double _appBarHeight = 256.0;
  AnimationController buttonController;
  Animation buttomZoomOut;
  MapView mapView = new MapView();
  final PlaceSimpleDto place;
  PlaceBloc placeBloc;
  _PlaceDetailState(this.place, this.placeBloc);

  showMap() {
    mapView.onMapReady.listen((_) {
      mapView.addMarker(new Marker(
        "1",
        widget.place.name,
        double.parse(place.address.lat),
        double.parse(place.address.lng),
      ));
    });

    mapView.show(
        new MapOptions(
            mapViewType: MapViewType.normal,
            showUserLocation: true,
            showMyLocationButton: true,
            showCompassButton: true,
            initialCameraPosition: new CameraPosition(
                new Location(double.parse(widget.place.address.lat),
                    double.parse(widget.place.address.lng)),
                15.0),
            hideToolbar: false,
            title: widget.place.name),
        toolbarActions: [new ToolbarAction("Close", 1)]);

    mapView.onToolbarAction.listen((id) {
      if (id == 1) {
        _handleDismiss();
      }
    });
  }

  _handleDismiss() async {
    mapView.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    buttonController.addListener(() {
      if (buttonController.isCompleted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ReservationPage()));
      }
    });

    return new Container(
        child: new CustomScrollView(
      slivers: <Widget>[
        new SliverAppBar(
          backgroundColor: Colors.black,
          pinned: true,
          expandedHeight: _appBarHeight - buttomZoomOut.value,
          bottom: PreferredSize(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Hero(
                      tag: 'placeName',
                      child: Text(
                        Extensions.adress(place.address),
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
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
              ),
            ),
            centerTitle: true,
            background: new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Hero(
                  tag: '_picture',
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
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: buttomZoomOut.value >= 200
                    ? new Container(
                        height: buttomZoomOut.value,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                      )
                    : Container(
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FlatButton(
                                    child: Text(
                                      'NAVIGATE',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () => print('navigate'),
                                  ),
                                  Container(
                                    height: 14.0,
                                    width: 2.0,
                                    color: Colors.grey,
                                  ),
                                  FlatButton(
                                    child: Text(
                                      'GO WITH UBER',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () => print('GO WITH UBER'),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  30.0, 10.0, 30.0, 10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    FlatButton(
                                        child: Text(
                                          'BOOK',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () => _openAddEntryDialog()),
                                    Container(
                                      height: 35.0,
                                      width: 2.0,
                                      color: Colors.grey,
                                    ),
                                    FlatButton(
                                      child: Text(
                                        'MENU',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                settings: RouteSettings(),
                                                builder: (context) => MenuPage(
                                                    place: widget.place)));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
              ),
            )
          ]),
        )
      ],
    ));
  }

  Widget buildPlaceInfo() {
    return widget.place == null
        ? SizedBox(
            child: CircularProgressIndicator(),
            width: 50.0,
            height: 50.0,
          )
        : Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new LeadingIcon(
                  icon: Icons.watch, child: OpenDropdown(place: place)),
              widget.place.phoneNumber != null
                  ? InkWell(
                      onTap: () => launch('tel://${widget.place.phoneNumber}'),
                      child: new LeadingIcon(
                        icon: Icons.phone,
                        child: Text(
                          widget.place.phoneNumber,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  : Container(),
              place.facebook != null
                  ? InkWell(
                      onTap: () => launch(place.facebook),
                      child: new LeadingIcon(
                        icon: MdiIcons.facebook,
                        child: Text(
                          place.friendlyUrl,
                          style: TextStyle(color: Colors.black),
                        ),
                      ))
                  : Container(),
            ],
          );
  }

  void _openAddEntryDialog() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new ReservationPage(
            place: place,
          );
        },
        fullscreenDialog: true));
  }

  dispose() {
    buttonController.dispose();
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
