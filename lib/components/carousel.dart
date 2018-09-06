import 'package:app/models/Places/place.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/places/places_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Carroussel extends StatefulWidget {
  Carroussel({this.navigateToDetail});

  final void Function(Place) navigateToDetail;

  @override
  _CarrousselState createState() =>
      new _CarrousselState(navigateToDetail: navigateToDetail);
}

class _CarrousselState extends State<Carroussel> {
  final void Function(Place) navigateToDetail;

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
  void didUpdateWidget(dynamic oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    placeBloc = DataProvider.getPlaces(context);
    placeBloc.loadPlaces();
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
      child: Hero(
        tag: '_picture',
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Container(
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.grey[300],
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(place.getPlaceImage()),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
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
              )),
        ),
      ),
    );
  }
}
