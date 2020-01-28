import 'dart:math';

import 'package:app/app/app.dart';
import 'package:app/components/Places/GooglePlaceAutocomplete/google_places.dart';
import 'package:app/components/Places/place_item.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/places/places_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:openapi/api.dart';
import 'package:queries/collections.dart';
import 'package:rxdart/rxdart.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesSearchResult {
  LatLng position;
  List<PlaceSimpleDto> places;
  String label;
}

class PlacesSearchPage extends StatefulWidget {
  final List<PlaceSimpleDto> places;
  final bool returnToMap;
  final String searchLabel;
  PlacesSearchPage({Key key, this.places, this.returnToMap = false, this.searchLabel}) : super(key: key);

  _PlacesSearchPageState createState() => _PlacesSearchPageState();
}

// to get places detail (lat/lng)

class _PlacesSearchPageState extends State<PlacesSearchPage> {
  BehaviorSubject<List<PlaceSimpleDto>> places;
  PlacesBloc placesBloc;
  GoogleMapsPlaces _places = GoogleMapsPlaces(baseUrl: "https://${App.baseUri}/api/Places/GoogleProxy");
  Mode _mode = Mode.overlay;
  String currentLocation;
  LatLng currentCitiLocation;
  String searchString = "";
  String session = "";
  @override
  initState() {
    session = Uuid().generateV4();
    super.initState();
    places = new BehaviorSubject.seeded(widget.places);
    this.currentLocation = widget.searchLabel ?? "Current location";
    new Future.delayed(Duration.zero, () {
      placesBloc = DataProvider.getData(context).placeBloc;
    });
  }

  Future<void> _handlePressButton() async {
    // show input autocomplete with selected mode
    // then get the Prediction selected

    Prediction p = await PlacesAutocomplete.show(
        sessionToken: session,
        context: context,
        apiKey: '',
        proxyBaseUrl: "https://${App.baseUri}/api/Places/GoogleProxy",
        onError: onError,
        mode: _mode,
        types: ['(cities)']);

    displayPrediction(p);
  }

  void onError(PlacesAutocompleteResponse response) {}

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      // get detail (lat/lng)
      PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);
      setState(() {
        this.currentLocation = detail.result.name;
      });
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;
      App.http.getNearbyPlaces(lat: lat, lng: lng).then((value) {
        places.add(value);
      });
      currentCitiLocation = new LatLng(lat, lng);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        bottomNavigationBar: Container(height: 55),
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Column(
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
                              decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(16.0)),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: <Widget>[
                                          Flexible(
                                              child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Icon(Icons.search),
                                          )),
                                          Expanded(
                                              child: Padding(
                                            padding: const EdgeInsets.only(left: 15.0),
                                            child: TextField(
                                              onChanged: (data) {
                                                setState(() {
                                                  this.searchString = data;
                                                });
                                              },
                                              decoration: InputDecoration(
                                                  hintText: 'Search', border: InputBorder.none, labelStyle: Theme.of(context).textTheme.headline4),
                                            ),
                                          )),
                                        ],
                                      )),
                                  Container(height: 1, color: Colors.white),
                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      children: <Widget>[
                                        Flexible(
                                          child: IconButton(
                                            icon: Icon(Icons.place),
                                            onPressed: () {
                                              setState(() {
                                                this.currentLocation = "Current location";
                                              });
                                              var location = this.placesBloc.location.value;
                                              App.http.getNearbyPlaces(lat: location.latitude, lng: location.longitude).then((value) {
                                                places.add(value);
                                                currentCitiLocation = new LatLng(location.latitude, location.longitude);
                                              });
                                            },
                                          ),
                                        ),
                                        Container(width: 1, color: Colors.white),
                                        Flexible(
                                            flex: 4,
                                            fit: FlexFit.tight,
                                            child: GestureDetector(
                                              onTap: () => _handlePressButton(),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 4.0),
                                                child: Text(this.currentLocation, style: Theme.of(context).textTheme.headline5),
                                              ),
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
                          data = dataCollection.where$1((a, _) => a.name.toUpperCase().contains(this.searchString.toUpperCase())).toList();
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
                ),
              ],
            ),
            if (widget.returnToMap)
              Positioned(
                right: 10,
                top: 12,
                child: FloatingActionButton(
                  heroTag: 'Search',
                  backgroundColor: AppColors.colors[0],
                  child: Icon(
                    Icons.map,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    var result = new PlacesSearchResult();
                    result.position = this.currentCitiLocation;
                    result.places = this.places.value;
                    result.label = this.currentLocation;
                    Navigator.of(context).pop(result);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Uuid {
  final Random _random = Random();

  String generateV4() {
    // Generate xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx / 8-4-4-4-12.
    final int special = 8 + _random.nextInt(4);

    return '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}-'
        '${_bitsDigits(16, 4)}-'
        '4${_bitsDigits(12, 3)}-'
        '${_printDigits(special, 1)}${_bitsDigits(12, 3)}-'
        '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}';
  }

  String _bitsDigits(int bitCount, int digitCount) => _printDigits(_generateBits(bitCount), digitCount);

  int _generateBits(int bitCount) => _random.nextInt(1 << bitCount);

  String _printDigits(int value, int count) => value.toRadixString(16).padLeft(count, '0');
}
