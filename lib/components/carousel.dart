import 'package:app/app/app.dart';
import 'package:app/models/Places/place.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/places/places_bloc.dart';
import 'package:flutter/material.dart';

class Carroussel extends StatefulWidget {
  @override
  _CarrousselState createState() => new _CarrousselState();
}

class _CarrousselState extends State<Carroussel> {
  PageController controller;
  int currentpage = 1;
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
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final placeBloc = DataProvider.getPlaces(context);

    return new Center(
        child: new Container(
      child: loadingBuilder(placeBloc),
    ));
  }

  StreamBuilder<bool> loadingBuilder(PlacesBloc bloc) {
    return StreamBuilder<bool>(
      initialData: true,
      stream: bloc.loading,
      builder: (context, snapshot) =>
          snapshot.data ? CircularProgressIndicator() : buildPlacePages(bloc),
    );
  }

  StreamBuilder<List<Place>> buildPlacePages(PlacesBloc bloc) {
    return StreamBuilder<List<Place>>(
        initialData: null,
        stream: bloc.places,
        builder: (context, snapshot) => PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentpage = value;
                });
              },
              controller: controller,
              itemCount: 5,
              itemBuilder: (context, index) =>
                  builder(index, snapshot.data[index]),
            ));
  }

  builder(int index, Place place) {
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

  InkWell buildInkWell(int index, Place place) {
    return new InkWell(
      child: new Container(
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.circular(10.0),
            color: Colors.grey[300],
          ),
          margin: const EdgeInsets.all(8.0),
          child: OverflowBox(
            child: new Padding(
              padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    App.baseUri + place.logoPath,
                    width: 40.0,
                    height: 40.0,
                  ),
                  new Text(
                    place.name,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  new Text(
                    place.address.toString(),
                    style: new TextStyle(color: Colors.grey),
                  ),
                  new Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      new Icon(Icons.ac_unit),
                      new Text(place.rating.toString())
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
