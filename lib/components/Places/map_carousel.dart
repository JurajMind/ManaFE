import 'dart:async';

import 'package:app/Helpers/place_helper.dart';
import 'package:app/const/theme.dart';
import 'package:app/models/extensions.dart';
import 'package:app/pages/Places/place_detail_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class MapCarousel extends StatefulWidget {
  PlaceSimpleDto selectedPlace;

  MapCarousel({this.nearbyPlaces, this.mapController, this.selectedPlace});
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

    if(widget.selectedPlace != null){
      currentpage = widget.nearbyPlaces.value.indexOf(widget.selectedPlace);
      widget.nearbyPlaces.doOnData((onData){
      var index = onData.indexOf(widget.selectedPlace);
       controller.jumpToPage(index);
     });
    }

    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.4,
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
              scrollDirection: Axis.horizontal,
              controller: controller,
              onPageChanged: (value) async {
                setState(() {
                  currentpage = value;
                });
                var place = snapshot.data[value];
                final GoogleMapController controller =
                    await widget.mapController.future;
                await controller.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        bearing: 0,
                        target: LatLng(double.parse(place.address.lat),
                            double.parse(place.address.lng)),
                        tilt: 0,
                        zoom: 15.151926040649414)));
              },
              itemCount: snapshot.data != null ? snapshot.data.length : 0,
              itemBuilder: (context, index) =>
                  buildInkWell(index, snapshot.data[index]),
            ));
  }

  InkWell buildInkWell(int index, PlaceSimpleDto place) {
    var isOpen = PlaceHelpers.isOpen(place);
    var textColor = Colors.white;
    if (isOpen != null && isOpen) {
      textColor = Colors.green;
    } else if (isOpen != null && !isOpen) {
      textColor = Colors.red;
    }
    return new InkWell(
      onTap: () async {
      
        if (currentpage > index) {
          controller.previousPage(
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        }

        if (currentpage < index) {
          controller.nextPage(
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        }

        if (currentpage == index) {
          if (true) {
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
          padding: const EdgeInsets.all(4.0),
          child: new Container(
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  border: new Border.all(
                      color: currentpage == index
                          ? AppColors.colors[1]
                          : Colors.transparent,
                      width: 2),
                  color: Colors.grey[300],
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          Extensions.getPlaceImage(place)),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: new AutoSizeText(
                              place.name,
                              minFontSize: 12,
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .display1
                                  .merge(TextStyle(
                                    color: textColor,
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
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: new Text(
                              Extensions.adress(place.address),
                              style: new TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
