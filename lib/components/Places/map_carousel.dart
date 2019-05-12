import 'dart:async';

import 'package:app/components/Places/open_indicator.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/places/places_bloc.dart';
import 'package:app/pages/Places/place_detail_page.dart';
import 'package:app/support/mana_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class MapCarousel extends StatefulWidget {
  MapCarousel({this.nearbyPlaces, this.mapController});
  final Completer<GoogleMapController> mapController;
  final BehaviorSubject<List<PlaceSimpleDto>> nearbyPlaces;
  @override
  _CarrousselState createState() => new _CarrousselState();
}

class _CarrousselState extends State<MapCarousel> {
  _CarrousselState();

  PageController controller;
  int currentpage = 0;
  bool loading = true;
  int clickedIndex = 0;

  @override
  initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.7,
    );
    controller.addListener(() {
      if (controller.page % 1 == 0) {}
    });
  }

  @override
  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
      child: buildPlacePages(widget.nearbyPlaces),
    ));
  }

  StreamBuilder<List<PlaceSimpleDto>> buildPlacePages(
      BehaviorSubject<List<PlaceSimpleDto>> bloc) {
    return StreamBuilder<List<PlaceSimpleDto>>(
        initialData: null,
        stream: bloc,
        builder: (context, snapshot) => PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentpage = value;
                });
              },
              controller: controller,
              itemCount: snapshot.data != null ? snapshot.data.length : 0,
              itemBuilder: (context, index) =>
                  builder(index, snapshot.data[index]),
            ));
  }

  builder(int index, PlaceSimpleDto place) {
    return new AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double value = 1.0;
          if (controller.position.haveDimensions) {
            value = controller.page - index;
            value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
          }

          return new Center(
            child: new SizedBox(
              height: Curves.easeOut.transform(value) * 200,
              width: Curves.easeOut.transform(value) * 400,
              child: child,
            ),
          );
        },
        child: buildInkWell(index, place));
  }

  InkWell buildInkWell(int index, PlaceSimpleDto place) {
    return new InkWell(
      onTap: () async {
        print('curent');
        var curentIndex = controller.page.round();

        if (curentIndex > index) {
          controller.previousPage(
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        }

        if (curentIndex < index) {
          controller.nextPage(
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        }

        if (curentIndex == index) {
          if (clickedIndex == index) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PlaceDetailPage(place: place)));
          }
          clickedIndex = index;
          final GoogleMapController controller =
              await widget.mapController.future;
          await controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  bearing: 0,
                  target: LatLng(double.parse(place.address.lat),
                      double.parse(place.address.lng)),
                  tilt: 0,
                  zoom: 15.151926040649414)));
        }
      },
      child: Hero(
        tag: '${place.friendlyUrl}_place',
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Container(
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.grey[300],
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          Extensions.getPlaceImage(place)),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Text(
                      place.name,
                      style:
                          Theme.of(context).textTheme.display1.merge(TextStyle(
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
                    new Text(
                      Extensions.adress(place.address),
                      style: new TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            new Icon(ManaIcons.hookah),
                            new Text(place.rating.toString()),
                          ],
                        ),
                        new OpenIndicator(
                          place: place,
                        )
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
