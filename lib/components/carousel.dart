import 'package:app/Helpers/place_helper.dart';
import 'package:app/components/Media/media.widget.dart';
import 'package:app/components/Places/open_indicator.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/places/places_bloc.dart';
import 'package:app/pages/Places/add_place_page.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:openapi/api.dart';
import 'dart:math' as math;

import 'Places/distance_widget.dart';

class Carroussel extends StatefulWidget {
  Carroussel({this.navigateToDetail});

  final void Function(PlaceSimpleDto) navigateToDetail;

  @override
  _CarrousselState createState() =>
      new _CarrousselState(navigateToDetail: navigateToDetail);
}

class _CarrousselState extends State<Carroussel> {
  final void Function(PlaceSimpleDto) navigateToDetail;

  PlacesBloc placeBloc;

  _CarrousselState({this.navigateToDetail});

  PageController controller;
  int currentpage = 0;
  bool loading = true;
  @override
  initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  Future didChangeDependencies() async {
    super.didChangeDependencies();
    if (placeBloc == null) {
      placeBloc = DataProvider.getPlaces(context);
      await placeBloc.loadPlaces();
    }
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
      child: buildPlacePages(placeBloc),
    ));
  }

  StreamBuilder<List<PlaceSimpleDto>> buildPlacePages(PlacesBloc bloc) {
    return StreamBuilder<List<PlaceSimpleDto>>(
        initialData: null,
        stream: bloc.places,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.data.length == 0) {
            return Container(height: 100, child: buildAdd());
          }
          return StreamBuilder<Position>(
              stream: bloc.location,
              builder: (context, position) {
                Map<int, double> positions = new Map<int, double>.fromIterable(
                    snapshot.data,
                    key: (v) => v.id,
                    value: (v) => PlaceHelpers.calculateDistanceFromAddress(
                        v.address, position.data));
                return PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentpage = value;
                    });
                  },
                  controller: controller,
                  itemCount: snapshot.data != null
                      ? math.min(snapshot.data.length, 5)
                      : 0,
                  itemBuilder: (context, index) =>
                      builder(index, snapshot.data[index], positions),
                );
              });
        });
  }

  builder(
    int index,
    PlaceSimpleDto place,
    Map<int, double> positions,
  ) {
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
        child: buildPlaceInkWell(index, place, positions[place.id]));
  }

  Widget buildAdd() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddPlacePage(), fullscreenDialog: true));
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
                    child: Text(
                      AppTranslations.of(context)
                          .text("reservations.add_new_place"),
                      style: Theme.of(context).textTheme.display2,
                    ),
                  )
                ],
              ))),
    );
  }

  InkWell buildPlaceInkWell(int index, PlaceSimpleDto place, double distance) {
    return new InkWell(
      onTap: () {
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
          navigateToDetail(place);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Container(
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.grey[300],
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        Extensions.getPlaceImage(place, MediaSize.Medium)),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text(place.name,
                      style: Theme.of(context).textTheme.display1.merge(
                            TextStyle(
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
                            ),
                          )),
                  new Text(Extensions.adress(place.address),
                      style: Theme.of(context).textTheme.display3.merge(
                            TextStyle(
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
                            ),
                          )),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          new Icon(FontAwesomeIcons.walking),
                          DistanceWidget(distance)
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
    );
  }
}
