import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/places/places_bloc.dart';
import 'package:app/support/mana_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:openapi/api.dart';

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
  void didUpdateWidget(dynamic oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (placeBloc == null) {
      placeBloc = DataProvider.getPlaces(context);
      placeBloc.loadPlaces();
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

  StreamBuilder<List<PlaceSimpleDto>> buildPlacePages(PlacesBloc bloc) {
    return StreamBuilder<List<PlaceSimpleDto>>(
        initialData: null,
        stream: bloc.places,
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
                      style: Theme.of(context).textTheme.display1,
                    ),
                    new Text(
                      Extensions.adress(place.address),
                      style: new TextStyle(color: Colors.grey),
                    ),
                    new Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        new Icon(ManaIcons.hookah),
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
