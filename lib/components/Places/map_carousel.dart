import 'dart:async';

import 'package:app/Helpers/place_helper.dart';
import 'package:app/components/Media/media.widget.dart';
import 'package:app/components/Places/WebMap/web_map_placeholder.dart'
    if (dart.library.js) 'package:app/components/Places/WebMap/web_map.dart';
import 'package:app/const/theme.dart';
import 'package:app/main.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/module.dart';

import 'package:app/pages/Places/place_detail_page.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:openapi/openapi.dart';
import 'package:rxdart/rxdart.dart';
import 'package:app/support/m_platform.dart';

class MapCarousel extends StatefulWidget {
  final PlaceSimpleDto? selectedPlace;

  MapCarousel(
      {this.nearbyPlaces,
      this.mapController,
      this.selectedPlace,
      this.direction = Axis.horizontal,
      this.webMapController});
  final Completer<GoogleMapController>? mapController;
  final GoogleWebMapController? webMapController;
  final BehaviorSubject<List<PlaceSimpleDto?>?>? nearbyPlaces;
  final Axis direction;
  @override
  _CarrousselState createState() => new _CarrousselState();
}

class _CarrousselState extends State<MapCarousel> {
  _CarrousselState();

  PageController? controller;
  int currentpage = 0;
  bool loading = true;
  int clickedIndex = 1;
  int? selectPlaceId = 0;
  BehaviorSubject<List<PlaceSimpleDto?>?>? nearbyPlaces;
  StreamSubscription<List<PlaceSimpleDto?>?>? subscription;
  @override
  initState() {
    super.initState();

    if (widget.selectedPlace != null) {
      selectPlaceId = widget.selectedPlace!.id;
      nearbyPlaces = widget.nearbyPlaces;
      currentpage = nearbyPlaces!.value!.indexOf(widget.selectedPlace);
      subscription = nearbyPlaces!.listen((onData) {
        var index = onData!.indexOf(widget.selectedPlace);
        controller!.jumpToPage(index + 1);
      });
    }

    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.4,
    );
    controller!.addListener(() {
      if (controller!.page! % 1 == 0) {}
    });
  }

  @override
  dispose() {
    controller!.dispose();
    subscription?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(MapCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedPlace?.id != this.widget.selectedPlace?.id) {
      selectPlaceId = widget.selectedPlace?.id;
      var pageIndex = this.widget.nearbyPlaces!.value!.indexOf(this.widget.selectedPlace);
      controller!.jumpToPage(pageIndex + 1);
      // controller.animateToPage(pageIndex + 1,
      //     curve: Curves.easeIn, duration: const Duration(milliseconds: 500));

    }
    if (oldWidget.selectedPlace == null && this.widget.selectedPlace == null) {
      if (widget.nearbyPlaces!.value == null) return;
      var newPageIndex = this.widget.nearbyPlaces!.value!.indexWhere((s) => s!.id == this.selectPlaceId);
      if (newPageIndex == -1) return;
      if (currentpage != newPageIndex) {
        controller!.jumpToPage(newPageIndex + 1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
      child: buildPlacePages(widget.nearbyPlaces),
    ));
  }

  StreamBuilder<List<PlaceSimpleDto?>?> buildPlacePages(BehaviorSubject<List<PlaceSimpleDto?>?>? bloc) {
    return StreamBuilder<List<PlaceSimpleDto?>?>(
        initialData: null,
        stream: bloc,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return CircularProgressIndicator();
          }

          if (snapshot.data!.length == 0) {
            return buildAdd();
          }
          return PageView.builder(
              scrollDirection: widget.direction,
              controller: controller,
              onPageChanged: (value) async {
                setState(() {
                  currentpage = value;
                  if (currentpage == -1 || currentpage == 0) {
                    return;
                  }
                  this.selectPlaceId = widget.nearbyPlaces!.value![currentpage - 1]!.id;
                });

                // go back for add page
                if (currentpage == 0) {
                  var currentLocation = getIt.get<PlacesBloc>().location.value;
                  var loc = LatLng(
                    currentLocation.latitude,
                    currentLocation.longitude,
                  );
                  await moveToLocation(loc);
                }
                var place = snapshot.data![value - 1]!;
                var loc = LatLng(double.parse(place.address!.lat!), double.parse(place.address!.lng!));
                await moveToLocation(loc);
              },
              itemCount: snapshot.data != null ? snapshot.data!.length + 1 : 0,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return buildAdd();
                }
                return buildInkWell(index, snapshot.data![index - 1]!);
              });
        });
  }

  Future<void> moveToLocation(LatLng loc) async {
    if (!MPlatform.isWeb) {
      final GoogleMapController controller = await widget.mapController!.future;
      await controller.animateCamera(
          CameraUpdate.newCameraPosition(CameraPosition(bearing: 0, target: loc, tilt: 0, zoom: 15.151926040649414)));
    } else {
      widget.webMapController!.moveToLocation(loc);
    }
  }

  Widget buildAdd() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Placeholder(), fullscreenDialog: true));
      },
      child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  border: new Border.all(color: Colors.white, width: 2),
                  color: Colors.transparent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add_location),
                  Hero(
                    tag: 'add_new_place_label',
                    child: Center(
                      child: Text(
                        AppTranslations.of(context)!.text("reservations.add_new_place"),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  )
                ],
              ))),
    );
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
          controller!.previousPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
        }

        if (currentpage < index) {
          controller!.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
        }

        if (currentpage == index) {
          if (true) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlaceDetailPage(place: place)));
          }
          clickedIndex = index;
          final GoogleMapController controller = await widget.mapController!.future;
          await controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              bearing: 0,
              target: LatLng(double.parse(place.address!.lat!), double.parse(place.address!.lng!)),
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
                  border:
                      new Border.all(color: currentpage == index ? AppColors.colors[1] : Colors.transparent, width: 2),
                  color: Colors.grey[300],
                  image: DecorationImage(
                      image: (MPlatform.isWeb
                              ? NetworkImage(Extensions.getPlaceImage(place, MediaSize.Medium))
                              : CachedNetworkImageProvider(Extensions.getPlaceImage(place, MediaSize.Medium)))
                          as ImageProvider<Object>,
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
                              place.name!,
                              minFontSize: 12,
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
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
