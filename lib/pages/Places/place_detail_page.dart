import 'package:app/app/app.dart';
import 'package:app/models/Places/place.dart';
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

class _PlaceDetailState extends State<PlaceDetailPage> {
  final double _appBarHeight = 256.0;
  MapView mapView = new MapView();
  final Place place;
  var staticMapProvider = new StaticMapProvider(App.googleApiKeys);
  _PlaceDetailState(this.place);

  showMap() {
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
  }

  @override
  Widget build(BuildContext context) {
    var mapUri = staticMapProvider.getStaticUri(
        new Location(place.address.lat, place.address.lng), 14,
        width: 450, height: 250, mapType: StaticMapViewType.roadmap);

    return new Container(
        child: new CustomScrollView(
      slivers: <Widget>[
        new SliverAppBar(
          expandedHeight: _appBarHeight,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_size_select_small),
            ),
          ],
          flexibleSpace: new FlexibleSpaceBar(
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 200.0,
                  child: Text(
                    place.name,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            centerTitle: true,
            background: new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Hero(
                  tag: '_picture',
                  child: new Image.network(
                    'https://picsum.photos/600/300',
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
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(),
                            flex: 1,
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () => showMap(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(mapUri.toString()),
                              ),
                            ),
                          )
                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          Text(
                            'NAVIGATE',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text('GO WITH UBER')
                        ],
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
}
