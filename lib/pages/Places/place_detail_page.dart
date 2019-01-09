import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/components/StarRating/star_ratting.dart';
import 'package:app/models/Places/place.dart';
import 'package:app/pages/Places/menu.page.dart';
import 'package:app/pages/Places/reservation_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

class PlaceDetailPage extends StatefulWidget {
  final Place place;

  PlaceDetailPage({this.place});

  @override
  State<StatefulWidget> createState() {
    return new _PlaceDetailState(place);
  }
}

class _PlaceDetailState extends State<PlaceDetailPage>
    with TickerProviderStateMixin {
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
  final Place place;
  var staticMapProvider = new StaticMapProvider(App.googleApiKeys);
  _PlaceDetailState(this.place);

  showMap() {
    mapView.onMapReady.listen((_) {
      mapView.addMarker(new Marker(
        "1",
        widget.place.name,
        widget.place.address.lat,
        widget.place.address.lng,
      ));
    });

    mapView.show(
        new MapOptions(
            mapViewType: MapViewType.normal,
            showUserLocation: true,
            showMyLocationButton: true,
            showCompassButton: true,
            initialCameraPosition: new CameraPosition(
                new Location(
                    widget.place.address.lat, widget.place.address.lng),
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
    var mapUri = staticMapProvider.getStaticUri(
        new Location(place.address.lat, place.address.lng), 13,
        width: 450, height: 350, mapType: StaticMapViewType.roadmap);

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
                        place.address.toString(),
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
                    image:
                        new CachedNetworkImageProvider(place.getPlaceImage()),
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
                                    child: Column(
                                      children: <Widget>[
                                        new IconLabel(
                                          icon: Icons.watch,
                                          child: Text(
                                            buttomZoomOut.value.toString(),
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        new IconLabel(
                                          icon: Icons.hot_tub,
                                          child: Text(
                                            'Cats not allowed',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        new IconLabel(
                                          icon: Icons.credit_card,
                                          child: Text(
                                            'Accepts cards',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  flex: 1,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () => showMap(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.network(
                                          mapUri.toString() + '&scale=2'),
                                    ),
                                  ),
                                )
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
                                         Navigator.of(context).push(MaterialPageRoute(
            settings: RouteSettings(),
            builder: (context) => MenuPage(place: widget.place)));
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

  void _openAddEntryDialog() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new ReservationPage();
        },
        fullscreenDialog: true));
  }

  dispose() {
    buttonController.dispose();
    super.dispose();
  }
}

class IconLabel extends StatelessWidget {
  final Widget child;
  final IconData icon;
  const IconLabel({Key key, this.child, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.black,
        ),
        child
      ],
    );
  }
}
