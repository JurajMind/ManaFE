import 'dart:async';
import 'dart:convert';

import 'package:app/pages/Places/places_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:openapi/api.dart';

/// The result returned after completing location selection.
class LocationResult {
  /// The human readable name of the location. This is primarily the
  /// name of the road. But in cases where the place was selected from Nearby
  /// places list, we use the <b>name</b> provided on the list item.
  String name; // or road

  /// The human readable locality of the location.
  String locality;

  /// Latitude/Longitude of the selected location.
  LatLng latLng;

  AddressDto address;
}

/// Nearby place data will be deserialized into this model.
class NearbyAddress {
  /// The human-readable name of the location provided. This value is provided
  /// for [LocationResult.name] when the user selects this nearby place.
  String name;

  /// The icon identifying the kind of place provided. Eg. lodging, chapel,
  /// hospital, etc.
  String icon;

  // Latitude/Longitude of the provided location.
  LatLng latLng;

  AddressDto address;
}

/// Autocomplete results item returned from Google will be deserialized
/// into this model.
class AutoCompleteItem {
  /// The id of the place. This helps to fetch the lat,lng of the place.
  String id;

  /// The text (name of place) displayed in the autocomplete suggestions list.
  String text;

  /// Assistive index to begin highlight of matched part of the [text] with
  /// the original query
  int offset;

  /// Length of matched part of the [text]
  int length;
}

/// Place picker widget made with map widget from
/// [google_maps_flutter](https://github.com/flutter/plugins/tree/master/packages/google_maps_flutter)
/// and other API calls to [Google Places API](https://developers.google.com/places/web-service/intro)
///
/// API key provided should have `Maps SDK for Android`, `Maps SDK for iOS`
/// and `Places API`  enabled for it
class PlacePicker extends StatefulWidget {
  /// API key generated from Google Cloud Console. You can get an API key
  /// [here](https://cloud.google.com/maps-platform/)
  final String apiKey;
  final LatLng initialTarget;
  final bool onlyLocation;
  PlacePicker(this.apiKey, this.initialTarget, {this.onlyLocation = false});

  @override
  State<StatefulWidget> createState() {
    return PlacePickerState();
  }
}

/// Place picker state
class PlacePickerState extends State<PlacePicker> {
  /// Initial waiting location for the map before the current user location
  /// is fetched.
  LatLng initialTarget;
  LatLng target;
  final Completer<GoogleMapController> mapController = Completer();

  /// Indicator for the selected location
  final Set<Marker> markers = Set();

  /// Result returned after user completes selection
  LocationResult locationResult;
  AddressDto result;
  String _mapStyle;

  /// Overlay to display autocomplete suggestions
  OverlayEntry overlayEntry;

  List<NearbyAddress> nearbyPlaces = List();

  /// Session token required for autocomplete API call
  String sessionToken = Uuid().generateV4();

  GlobalKey appBarKey = GlobalKey();

  bool hasSearchTerm = false;

  String previousSearchTerm = '';

  // constructor
  PlacePickerState();

  void onMapCreated(GoogleMapController controller) {
    this.mapController.complete(controller);
    controller.setMapStyle(_mapStyle);
    moveToCurrentUserLocation();
  }

  @override
  initState() {
    initialTarget = widget.initialTarget ?? LatLng(5.5911921, -0.3198162);
     target = initialTarget;
    markers.add(
      Marker(
        position: initialTarget,
        markerId: MarkerId("selected-location"),
      ),
    );
    super.initState();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  void setState(fn) {
    if (this.mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    this.overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(height: 50,),
      appBar: AppBar(
        key: this.appBarKey,
        title: SearchInput((it) {
          searchPlace(it);
        }),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: initialTarget,
                zoom: 15,
              ),
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              onMapCreated: onMapCreated,
              onTap: (latLng) {
                clearOverlay();
                moveToLocation(latLng);
              },
              markers: markers,
            ),
          ),
          (this.hasSearchTerm)
              ? SizedBox()
              : widget.onlyLocation ? buildOnlyLocation(context) : buildNearbyAddress(context),
                      ],
                    ),
                  );
                }
              
                Expanded buildNearbyAddress(BuildContext context) {
                  return Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Divider(
                                    height: 8,
                                  ),
                                  Padding(
                                    child: Text(
                                      "Select nearby address",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 8,
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView(
                                      children: this
                                          .nearbyPlaces
                                          .map((it) => NearbyPlaceItem(it, () {
                                                Navigator.of(context).pop(it);
                                              }))
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                }
              
                /// Hides the autocomplete overlay
                void clearOverlay() {
                  if (this.overlayEntry != null) {
                    this.overlayEntry.remove();
                    this.overlayEntry = null;
                  }
                }
              
                /// Begins the search process by displaying a "wait" overlay then
                /// proceeds to fetch the autocomplete list. The bottom "dialog"
                /// is hidden so as to give more room and better experience for the
                /// autocomplete list overlay.
                void searchPlace(String place) {
                  // on keyboard dismissal, the search was being triggered again
                  // this is to cap that.
                  if (place == this.previousSearchTerm) {
                    return;
                  } else {
                    previousSearchTerm = place;
                  }
              
                  if (context == null) {
                    return;
                  }
              
                  clearOverlay();
              
                  setState(() {
                    hasSearchTerm = place.length > 0;
                  });
              
                  if (place.length < 1) {
                    return;
                  }
              
                  final RenderBox renderBox = context.findRenderObject();
                  Size size = renderBox.size;
              
                  final RenderBox appBarBox =
                      this.appBarKey.currentContext.findRenderObject();
              
                  this.overlayEntry = OverlayEntry(
                    builder: (context) => Positioned(
                      top: appBarBox.size.height,
                      width: size.width,
                      child: Material(
                        elevation: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 24,
                          ),
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                ),
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Expanded(
                                child: Text(
                                  "Finding place...",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
              
                  Overlay.of(context).insert(this.overlayEntry);
              
                  autoCompleteSearch(place);
                }
              
                /// Fetches the place autocomplete list with the query [place].
                void autoCompleteSearch(String place) {
                  place = place.replaceAll(" ", "+");
                  var endpoint =
                      "https://maps.googleapis.com/maps/api/place/autocomplete/json?" +
                          "key=${widget.apiKey}&" +
                          "input={$place}&sessiontoken=${this.sessionToken}";
              
                  if (this.locationResult != null) {
                    endpoint += "&location=${this.locationResult.latLng.latitude}," +
                        "${this.locationResult.latLng.longitude}";
                  }
                  http.get(endpoint).then((response) {
                    if (response.statusCode == 200) {
                      Map<String, dynamic> data = jsonDecode(response.body);
                      List<dynamic> predictions = data['predictions'];
              
                      List<RichSuggestion> suggestions = [];
              
                      if (predictions.isEmpty) {
                        AutoCompleteItem aci = AutoCompleteItem();
                        aci.text = "No result found";
                        aci.offset = 0;
                        aci.length = 0;
              
                        suggestions.add(RichSuggestion(aci, () {}));
                      } else {
                        for (dynamic t in predictions) {
                          AutoCompleteItem aci = AutoCompleteItem();
              
                          aci.id = t['place_id'];
                          aci.text = t['description'];
                          aci.offset = t['matched_substrings'][0]['offset'];
                          aci.length = t['matched_substrings'][0]['length'];
              
                          suggestions.add(RichSuggestion(aci, () {
                            FocusScope.of(context).requestFocus(FocusNode());
              
                            decodeAndSelectPlace(aci.id);
                          }));
                        }
                      }
              
                      displayAutoCompleteSuggestions(suggestions);
                    }
                  }).catchError((error) {
                    print(error);
                  });
                }
              
                void decodeAndSelectPlace(String placeId) {
                  clearOverlay();
              
                  String endpoint =
                      "https://maps.googleapis.com/maps/api/place/details/json?key=${widget.apiKey}" +
                          "&placeid=$placeId";
              
                  http.get(endpoint).then((response) {
                    if (response.statusCode == 200) {
                      Map<String, dynamic> location =
                          jsonDecode(response.body)['result']['geometry']['location'];
              
                      LatLng latLng = LatLng(location['lat'], location['lng']);
              
                      moveToLocation(latLng);
                    }
                  }).catchError((error) {
                    print(error);
                  });
                }
              
                /// Display autocomplete suggestions with the overlay.
                void displayAutoCompleteSuggestions(List<RichSuggestion> suggestions) {
                  final RenderBox renderBox = context.findRenderObject();
                  Size size = renderBox.size;
              
                  final RenderBox appBarBox =
                      this.appBarKey.currentContext.findRenderObject();
              
                  clearOverlay();
              
                  this.overlayEntry = OverlayEntry(
                    builder: (context) => Positioned(
                      width: size.width,
                      top: appBarBox.size.height,
                      child: Material(
                        elevation: 1,
                        color: Colors.white,
                        child: Column(
                          children: suggestions,
                        ),
                      ),
                    ),
                  );
              
                  Overlay.of(context).insert(this.overlayEntry);
                }
              
                /// Utility function to get clean readable name of a location. First checks
                /// for a human-readable name from the nearby list. This helps in the cases
                /// that the user selects from the nearby list (and expects to see that as a
                /// result, instead of road name). If no name is found from the nearby list,
                /// then the road name returned is used instead.
                String getLocationName() {
                  if (this.locationResult == null) {
                    return "Unnamed location";
                  }
              
                  for (NearbyAddress np in this.nearbyPlaces) {
                    if (np.latLng == this.locationResult.latLng) {
                      this.locationResult.name = np.name;
                      return np.name;
                    }
                  }
              
                  return "${this.locationResult.name}, ${this.locationResult.locality}";
                }
              
                /// Moves the marker to the indicated lat,lng
                void setMarker(LatLng latLng) {
                  // markers.clear();
                  setState(() {
                    target = latLng;
                    markers.clear();
                    markers.add(
                      Marker(
                        markerId: MarkerId("selected-location"),
                        position: latLng,
                      ),
                    );
                  });
                }
              
                /// Fetches and updates the nearby places to the provided lat,lng
                void getNearbyPlaces(LatLng latLng) {
                  http
                      .get("https://maps.googleapis.com/maps/api/geocode/json?" +
                          "key=${widget.apiKey}&" +
                          "latlng=${latLng.latitude},${latLng.longitude}")
                      .then((response) {
                    if (response.statusCode == 200) {
                      this.nearbyPlaces.clear();
                      for (Map<String, dynamic> item
                          in jsonDecode(response.body)['results']) {
                        NearbyAddress nearbyPlace = NearbyAddress();
                        nearbyPlace.address = new AddressDto();
                        List<dynamic> addressComponents = item["address_components"];
                        var address = extractAddress(addressComponents);
              
                        if (address == null) continue;
                        nearbyPlace.name = item["formatted_address"];
                        double latitude = item['geometry']['location']['lat'];
                        double longitude = item['geometry']['location']['lng'];
                        address.lat = latitude.toString();
                        address.lng = longitude.toString();
                        LatLng _latLng = LatLng(latitude, longitude);
              
                        nearbyPlace.latLng = _latLng;
                        nearbyPlace.address = address;
              
                        this.nearbyPlaces.add(nearbyPlace);
                      }
                    }
              
                    // to update the nearby places
                    setState(() {
                      // this is to require the result to show
                      this.hasSearchTerm = false;
                    });
                  }).catchError((error) {});
                }
              
                String extractAddressFeature(types, f, String key) {
                  try {
                    if (types.indexOf(key) > -1) {
                      return f['long_name'];
                    }
                    return null;
                  } catch (e) {
                    return null;
                  }
                }
              
                AddressDto extractAddress(List<dynamic> addressComponents) {
                  AddressDto result = new AddressDto();
                  String number;
                  String street;
                  String zip;
                  String locality;
                  String locality1;
                  String locality2;
                  String country;
                  addressComponents.forEach((f) {
                    try {
                      var types = f['types'];
                      number = number ?? extractAddressFeature(types, f, 'street_number');
                      street = street ?? extractAddressFeature(types, f, 'route');
                      zip = zip ?? extractAddressFeature(types, f, 'postal_code');
                      locality = locality ?? extractAddressFeature(types, f, 'locality');
                      locality1 = locality1 ??
                          extractAddressFeature(types, f, 'administrative_area_level_1');
                      locality2 = locality2 ??
                          extractAddressFeature(types, f, 'administrative_area_level_2');
                      country = country ?? extractAddressFeature(types, f, 'country');
              
                      return null;
                    } catch (e) {}
                  });
              
                  result.city = locality ?? locality1 ?? locality2;
                  result.number = number;
                  result.ZIP = zip;
                  result.street = street;
                  result.country = country;
                  if (zip != null && street != null) return result;
              
                  return null;
                }
              
                /// Moves the camera to the provided location and updates other UI features to
                /// match the location.
                void moveToLocation(LatLng latLng) {
                  this.mapController.future.then((controller) {
                    controller.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: latLng,
                          zoom: 15.0,
                        ),
                      ),
                    );
                  });
              
                  setMarker(latLng);
                if(!widget.onlyLocation)
                  getNearbyPlaces(latLng);
                }
              
                Future moveToCurrentUserLocation() async {
                  var geolocator = Geolocator();
                  GeolocationStatus geolocationStatus =
                      await geolocator.checkGeolocationPermissionStatus();
                  if (geolocationStatus == GeolocationStatus.denied) return;
                  geolocator
                      .getLastKnownPosition(desiredAccuracy: LocationAccuracy.low)
                      .then((value) async {
                    if (value != null) {
                      LatLng target = LatLng(value.latitude, value.longitude);
                      moveToLocation(target);
                    }
                  }).catchError((error) {
                    // TODO: Handle the exception here
                    print(error);
                  });
                }
              
                Widget buildOnlyLocation(BuildContext context) {
                  return Expanded(flex: 2,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                                         OutlineButton(
                        color: Colors.green,
                        child: Text("Submit"),
                        onPressed: () {
                          var location = new NearbyAddress();
                          location.latLng = 
                         location.latLng = this.target;
                          Navigator.of(context).pop(location);
                        },
                      ),
                                                               OutlineButton(
                        color: Colors.red,
                        child: Text("Cancel"),
                        onPressed: () {
                             Navigator.of(context).pop();
                        },
                      ),
                  ],));
                }
}

/// Custom Search input field, showing the search and clear icons.
class SearchInput extends StatefulWidget {
  final ValueChanged<String> onSearchInput;

  SearchInput(this.onSearchInput);

  @override
  State<StatefulWidget> createState() {
    return SearchInputState();
  }
}

class SearchInputState extends State<SearchInput> {
  TextEditingController editController = TextEditingController();

  Timer debouncer;

  bool hasSearchEntry = false;

  SearchInputState();

  @override
  void initState() {
    super.initState();
    this.editController.addListener(this.onSearchInputChange);
  }

  @override
  void dispose() {
    this.editController.removeListener(this.onSearchInputChange);
    this.editController.dispose();

    super.dispose();
  }

  void onSearchInputChange() {
    if (this.editController.text.isEmpty) {
      this.debouncer?.cancel();
      widget.onSearchInput(this.editController.text);
      return;
    }

    if (this.debouncer?.isActive ?? false) {
      this.debouncer.cancel();
    }

    this.debouncer = Timer(Duration(milliseconds: 500), () {
      widget.onSearchInput(this.editController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              style: Theme.of(context)
                  .textTheme
                  .display2
                  .apply(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Search address",
                fillColor: Colors.black,
                hintStyle: Theme.of(context)
                    .textTheme
                    .display2
                    .apply(color: Colors.black),
                border: InputBorder.none,
              ),
              controller: this.editController,
              onChanged: (value) {
                setState(() {
                  this.hasSearchEntry = value.isNotEmpty;
                });
              },
            ),
          ),
          SizedBox(
            width: 8,
          ),
          this.hasSearchEntry
              ? GestureDetector(
                  child: Icon(
                    Icons.clear,
                  ),
                  onTap: () {
                    this.editController.clear();
                    setState(() {
                      this.hasSearchEntry = false;
                    });
                  },
                )
              : SizedBox(),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[100],
      ),
    );
  }
}

class SelectPlaceAction extends StatelessWidget {
  final String locationName;
  final VoidCallback onTap;

  SelectPlaceAction(this.locationName, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          this.onTap();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      locationName,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Tap to select this location",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NearbyPlaceItem extends StatelessWidget {
  final NearbyAddress nearbyPlace;
  final VoidCallback onTap;

  NearbyPlaceItem(this.nearbyPlace, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: InkWell(
        onTap: onTap,
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Text(
                    "${nearbyPlace.name}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class RichSuggestion extends StatelessWidget {
  final VoidCallback onTap;
  final AutoCompleteItem autoCompleteItem;

  RichSuggestion(this.autoCompleteItem, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RichText(
                    text: TextSpan(children: getStyledTexts(context)),
                  ),
                )
              ],
            )),
        onTap: this.onTap,
      ),
    );
  }

  List<TextSpan> getStyledTexts(BuildContext context) {
    final List<TextSpan> result = [];

    String startText =
        this.autoCompleteItem.text.substring(0, this.autoCompleteItem.offset);
    if (startText.isNotEmpty) {
      result.add(
        TextSpan(
          text: startText,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
      );
    }

    String boldText = this.autoCompleteItem.text.substring(
        this.autoCompleteItem.offset,
        this.autoCompleteItem.offset + this.autoCompleteItem.length);

    result.add(TextSpan(
      text: boldText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
    ));

    String remainingText = this
        .autoCompleteItem
        .text
        .substring(this.autoCompleteItem.offset + this.autoCompleteItem.length);
    result.add(
      TextSpan(
        text: remainingText,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
      ),
    );

    return result;
  }
}
