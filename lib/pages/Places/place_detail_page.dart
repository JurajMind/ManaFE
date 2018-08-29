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
  final Place place;
  var staticMapProvider = new StaticMapProvider(App.googleApiKeys);  
  _PlaceDetailState(this.place);

  @override  
  Widget build(BuildContext context) {

var mapUri = staticMapProvider.getStaticUri(new Location(place.address.lng,place.address.lat), 14,
        width: 450, height: 250, mapType: StaticMapViewType.roadmap);

    return new Container(
      child: new CustomScrollView(
      slivers: <Widget>[
        new SliverAppBar(
          expandedHeight: _appBarHeight,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.photo_size_select_small),
            onPressed: () => print('test')),
            
          ],
          flexibleSpace: new FlexibleSpaceBar(
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(place.name),
              ],
            ),
            centerTitle: true,
            background: new Stack(
              fit: StackFit.expand
            ),
          ),
        ),
        new SliverList(delegate: new SliverChildListDelegate(<Widget>[
          Container(
                      child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)
                ),
                              child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        Expanded(child: Column(

                        ),flex: 1,),
                        Expanded(flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                           mapUri.toString()
                          ),
                        ),)
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        Text('NAVIGATE'),
                        Text('GO WITH UBER')
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ]),)
      ]
      ,
      )
    );
  }
}
