import 'package:app/app/app.dart';
import 'package:app/components/Places/GooglePlaceAutocomplete/google_places.dart';
import 'package:app/components/Places/place_item.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/places/places_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:openapi/api.dart';
import 'package:queries/collections.dart';
import 'package:rxdart/rxdart.dart';

class PlacesSearchPage extends StatefulWidget {
  final List<PlaceSimpleDto> places;
  PlacesSearchPage({Key key, this.places}) : super(key: key);

  _PlacesSearchPageState createState() => _PlacesSearchPageState();
}

// to get places detail (lat/lng)

class _PlacesSearchPageState extends State<PlacesSearchPage> {
  BehaviorSubject<List<PlaceSimpleDto>> places;
  PlacesBloc placesBloc;
  static const kGoogleApiKey = "AIzaSyDv2o2BsQ1IJjdPS3eSjkf7f-_Jt7Fu-MU";
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
  Mode _mode = Mode.overlay;
  String currentLocation;
  String searchString = "";
  @override
  initState() {
    super.initState();
    places = new BehaviorSubject.seeded(widget.places);
    this.currentLocation = "Current location";
    new Future.delayed(Duration.zero, () {
      placesBloc = DataProvider.getData(context).placeBloc;
    });
  }

  Future<void> _handlePressButton() async {
    // show input autocomplete with selected mode
    // then get the Prediction selected
    Prediction p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        onError: onError,
        mode: _mode,
        types: ['(cities)']);

    displayPrediction(p);
  }

  void onError(PlacesAutocompleteResponse response) {}

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      // get detail (lat/lng)
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      setState(() {
        this.currentLocation = detail.result.name;
      });
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;
      App.http.getNearbyPlaces(lat: lat, lng: lng).then((value) {
        places.add(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(16.0)),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: <Widget>[
                                      Flexible(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Icon(Icons.search),
                                      )),
                                      Expanded(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: TextField(
                                          onChanged: (data) {
                                            setState(() {
                                              this.searchString = data;
                                            });
                                          },
                                          decoration: InputDecoration(
                                              hintText: 'Search',
                                              border: InputBorder.none,
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .body2),
                                        ),
                                      )),
                                    ],
                                  )),
                              Container(height: 1, color: Colors.white),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: IconButton(
                                        icon: Icon(Icons.place),
                                        onPressed: () {
                                          setState(() {
                                            this.currentLocation =
                                                "Current location";
                                          });
                                          var location =
                                              this.placesBloc.location.value;
                                          App.http
                                              .getNearbyPlaces(
                                                  lat: location.latitude,
                                                  lng: location.longitude)
                                              .then((value) {
                                            places.add(value);
                                          });
                                        },
                                      ),
                                    ),
                                    Container(width: 1, color: Colors.white),
                                    Expanded(
                                        child: GestureDetector(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Text(this.currentLocation,
                                            style: Theme.of(context)
                                                .textTheme
                                                .display2),
                                      ),
                                      onTap: () => _handlePressButton(),
                                    )),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 11,
              child: StreamBuilder<List<PlaceSimpleDto>>(
                  stream: this.places,
                  builder: (context, snapshot) {
                    var data = snapshot.data;
                    if (data != null && this.searchString != "") {
                      var dataCollection = Collection(data);
                      data = dataCollection
                          .where$1((a, _) => a.name
                              .toUpperCase()
                              .contains(this.searchString.toUpperCase()))
                          .toList();
                    }

                    return snapshot.data == null
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              var place = data[index];
                              return new PlaceItem(place: place);
                            },
                          );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
