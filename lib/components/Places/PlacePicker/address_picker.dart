import 'package:app/components/Places/PlacePicker/place_picker.dart';
import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressPicker extends StatefulWidget {
  final ValueChanged<NearbyAddress> onAddressChange;

  AddressPicker({Key key, this.onAddressChange}) : super(key: key);

  _AddressPickerState createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
  static const kGoogleApiKey = "AIzaSyDv2o2BsQ1IJjdPS3eSjkf7f-_Jt7Fu-MU";
  NearbyAddress _address;
  bool invalidAddress = false;
  TextEditingController _streetController;
  TextEditingController _numberController;
  TextEditingController _cityController;
  TextEditingController _zipController;
  TextEditingController _countryController;
  TextEditingController _latController;
  TextEditingController _lngController;

  @override
  initState() {
    _streetController = new TextEditingController();
    _numberController = new TextEditingController();
    _cityController = new TextEditingController();
    _zipController = new TextEditingController();
    _countryController = new TextEditingController();
    _latController = new TextEditingController();
    _lngController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var placesBloc = DataProvider.getData(context).placeBloc;
    LatLng initPosition;
    if (placesBloc.location.value != null) {
      LatLng(placesBloc.location.value.latitude,
          placesBloc.location.value.longitude);
    }

    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Address',
                      style: new TextStyle(
                          fontSize: 16,
                          color: invalidAddress ? Colors.red : Colors.grey)),
                  SizedBox(height: 5),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: _streetController,
                              decoration: const InputDecoration(
                                hintText: '',
                                labelText: 'Street',
                              ),
                              onSaved: (String value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              onEditingComplete: () {
                                _address.address.street =
                                    this._streetController.value.text;
                                widget.onAddressChange(_address);
                              },
                              validator: (String value) {
                                return value.contains('@')
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: _numberController,
                              decoration: const InputDecoration(
                                hintText: '',
                                labelText: 'Number',
                              ),
                              onSaved: (String value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              onEditingComplete: () {
                                _address.address.number =
                                    this._numberController.value.text;
                                widget.onAddressChange(_address);
                              },
                              validator: (String value) {
                                return value.contains('@')
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: _cityController,
                              decoration: const InputDecoration(
                                hintText: '',
                                labelText: 'City',
                              ),
                              onSaved: (String value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              onEditingComplete: () {
                                _address.address.city =
                                    this._cityController.value.text;
                                widget.onAddressChange(_address);
                              },
                              validator: (String value) {
                                return value.contains('@')
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: _zipController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: '',
                                labelText: 'ZIP',
                              ),
                              onSaved: (String value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              onEditingComplete: () {
                                _address.address.ZIP =
                                    this._zipController.value.text;
                                widget.onAddressChange(_address);
                              },
                              validator: (String value) {
                                return value.contains('@')
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: _countryController,
                        decoration: const InputDecoration(
                          hintText: '',
                          labelText: 'Country',
                        ),
                        onSaved: (String value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String value) {
                          return value.contains('@')
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.place),
                            onPressed: () => showLocationPicker(initPosition),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: _latController,
                              enabled: false,
                              decoration: const InputDecoration(
                                labelText: 'Latitude',
                              ),
                              onSaved: (String value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              validator: (String value) {
                                return value.contains('@')
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: _lngController,
                              enabled: false,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: '',
                                labelText: 'Longitude',
                              ),
                              onSaved: (String value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              validator: (String value) {
                                return value.contains('@')
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )),
          Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.map),
                onPressed: () async {
                  showPlacePicker(initPosition);
                },
              ))
        ],
      ),
    );
  }

  void showPlacePicker(LatLng initPosition) async {
    NearbyAddress result = await Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => PlacePicker(
              kGoogleApiKey,
              _address?.latLng ?? initPosition,
            )));

    // Handle the result in your way
    print(result);
    widget.onAddressChange(result);
    setState(() {
      _address = result;
      if (result == null) {
        invalidAddress = true;
      } else {
        invalidAddress = false;
        _streetController.text = result.address.street;
        _numberController.text = result.address.number;
        _cityController.text = result.address.city;
        _zipController.text = result.address.ZIP;
        _countryController.text = result.address.country;
        _latController.text = result.address.lat;
        _lngController.text = result.address.lng;
        initPosition = result.latLng;
      }
    });
  }

  void showLocationPicker(LatLng initPosition) async {
    NearbyAddress result = await Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => PlacePicker(
              kGoogleApiKey,
              _address?.latLng ?? initPosition,
              onlyLocation: true,
            )));

    // Handle the result in your way
    print(result);
    setState(() {
      _address = result;
      if (result == null) {
      } else {
        initPosition = result.latLng;
        _latController.text = result.latLng.latitude.toStringAsPrecision(9);
        _lngController.text = result.latLng.longitude.toStringAsPrecision(9);
        _address.latLng = result.latLng;
        _address.address.lat = result.latLng.latitude.toString();
        _address.address.lng = result.latLng.longitude.toString();
      }
    });
    widget.onAddressChange(_address);
  }
}
