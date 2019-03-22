import 'dart:async';

import 'package:app/Helpers/date_utils.dart';
import 'package:app/app/app.dart';
import 'package:app/components/Places/GooglePlaceAutocomplete/google_places.dart';

import 'package:app/components/Places/map_carousel.dart';
import 'package:app/const/theme.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class PlacesMapPage extends StatefulWidget {
  final Position position;

  PlacesMapPage({this.position});

  @override
  State<PlacesMapPage> createState() => _PlacesMapPageState();
}

class _PlacesMapPageState extends State<PlacesMapPage> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition initView;
  @override
  initState() {
    super.initState();

    if (widget.position != null) {
      initView = CameraPosition(
        target: LatLng(widget.position.latitude, widget.position.longitude),
        zoom: 14.4746,
      );
    }

    if (widget.position == null) {
      initView = CameraPosition(
        target: LatLng(37.42796133580664, -122.085749655962),
        zoom: 14.4746,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var placeBloc = DataProvider.getData(context).placeBloc;

    var markers = placeBloc.places.value.map((f) {
      return new Marker(
          markerId: MarkerId(f.id.toString()),
          infoWindow:
              InfoWindow(title: f.name, snippet: Extensions.adress(f.address)),
          position:
              LatLng(double.parse(f.address.lat), double.parse(f.address.lng)));
    }).toSet();
    return SafeArea(
      top: true,
      child: new Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: SizedBox(
          height: 55,
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              markers: markers,
              myLocationEnabled: false,
              mapType: MapType.normal,
              compassEnabled: true,
              tiltGesturesEnabled: true,
              initialCameraPosition: initView,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Positioned(
              bottom: 40,
              child: Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: MapCarousel(
                    placeBloc: placeBloc, mapController: _controller),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: FloatingActionButton(
                heroTag: 'Search',
                backgroundColor: AppColors.blue,
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () => searchCity(),
              ),
            ),
            Positioned(
              bottom: 160,
              right: 10,
              child: FloatingActionButton(
                backgroundColor: AppColors.gray.withAlpha(40),
                child: Icon(
                  Icons.track_changes,
                  color: Colors.black,
                ),
                onPressed: () async {
                  var controller = await _controller.future;
                  Geolocator()
                      .getLastKnownPosition(
                          desiredAccuracy: LocationAccuracy.low)
                      .then((value) {
                    if (value != null) {
                      var position = CameraUpdate.newCameraPosition(
                          CameraPosition(
                              bearing: 0,
                              target: LatLng(value.latitude, value.longitude),
                              tilt: 0,
                              zoom: 15.151926040649414));
                      controller.animateCamera(position);
                    }
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void searchCity() async {
    var kGoogleApiKey = App.googleApiKeys;

    Prediction p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        mode: Mode.overlay, // Mode.fullscreen
        language: "en",
        components: [new Component(Component.country, "en")]);
  }
}
