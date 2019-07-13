import 'dart:convert';
import 'dart:io';

import 'package:app/app/app.dart';
import 'package:app/components/Places/PlacePicker/address_picker.dart';
import 'package:app/components/Places/PlacePicker/place_picker.dart';
import 'package:app/components/Places/open_dropdown.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:openapi/api.dart';

import 'AddPlace/opening_hours_page.dart';
import 'add_place_submit_page.dart';
import 'package:image_picker/image_picker.dart';

class AddPlacePage extends StatefulWidget {
  AddPlacePage({Key key}) : super(key: key);

  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  static const kGoogleApiKey = "AIzaSyDv2o2BsQ1IJjdPS3eSjkf7f-_Jt7Fu-MU";
  final GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  NearbyAddress _address;
  List<EditablkeBusinessHour> _businessHour;
  TextEditingController _addressController;
  File _image;
  PlaceDto _result;

  bool invalidAddress = false;

  bool _uploading = false;

  @override
  Widget build(BuildContext context) {
    var placesBloc = DataProvider.getData(context).placeBloc;
    LatLng initPosition;
    if (placesBloc.location.value != null) {
      LatLng(placesBloc.location.value.latitude,
          placesBloc.location.value.longitude);
    }

    return Scaffold(
      appBar: AppBar(
        title: Hero(tag: 'add_new_place_label', child: Text('Add new place')),
        backgroundColor: AppColors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FormBuilder(
              key: fbKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    attribute: "name",
                    decoration: InputDecoration(labelText: "Name"),
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.max(70),
                    ],
                  ),
                  FormBuilderTextField(
                    attribute: "phoneNumber",
                    decoration: InputDecoration(
                        labelText: "Phone number or other contact"),
                    validators: [],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AddressPicker(
                    onAddressChange: (add) {
                      this._address = add;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Opening hours',
                                  style: new TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                              SizedBox(height: 5),
                              _businessHour == null
                                  ? Text("No opening hours")
                                  : OpenDropdown(
                                      hours: _businessHour,
                                      dark: true,
                                    )
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () async {
                              showOpeningHourPicker();
                            },
                          ))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Photo',
                                  style: new TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                              SizedBox(height: 5),
                              _image == null
                                  ? Text('No image selected.')
                                  : Image.file(_image),
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(Icons.photo_library),
                            onPressed: () async {
                              var image = await ImagePicker.pickImage(
                                  source: ImageSource.gallery);

                              setState(() {
                                _image = image;
                              });
                            },
                          )),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(Icons.camera_enhance),
                            onPressed: () async {
                              var image = await ImagePicker.pickImage(
                                  source: ImageSource.camera);

                              setState(() {
                                _image = image;
                              });
                            },
                          ))
                    ],
                  ),
                  FormBuilderCheckboxList(
                    decoration: InputDecoration(
                        labelText: "Place features",
                        labelStyle: TextStyle(fontSize: 24)),
                    attribute: "features",            
                    options: [
                      FormBuilderFieldOption(
                          value: "WIFI", label: "Wifi available"),
                      FormBuilderFieldOption(
                          value: "CARD", label: "Credit card accepted"),
                      FormBuilderFieldOption(
                          value: "OUTDOOR", label: "Outdoor seats available"),
                      FormBuilderFieldOption(
                          value: "FOOD", label: "Food available"),
                      FormBuilderFieldOption(
                          value: "PET", label: "Pet accepted"),
                    ],
                  ),
                  FormBuilderSwitch(
                    label: Text('I am owner of this place'),
                    attribute: "owner",
                    initialValue: false,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _uploading
                ? CircularProgressIndicator()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      OutlineButton(
                        color: Colors.green,
                        child: Text("Submit"),
                        onPressed: () {
                          savePlace(context);
                        },
                      ),
                      MaterialButton(
                        child: Text("Reset"),
                        onPressed: () {
                          fbKey.currentState.reset();
                        },
                      ),
                    ],
                  ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  void savePlace(BuildContext context) {
    fbKey.currentState.save();
    if (_address == null) {
      setState(() {
        invalidAddress = true;
        return;
      });
    }
    if (fbKey.currentState.validate()) {
      if (_address == null) return;
      print(fbKey.currentState.value);

      _result = new PlaceDto();
      _result.name = fbKey.currentState.value['name'];
      var contact = fbKey.currentState.value['phoneNumber'];
      _result.facebook =
          fbKey.currentState.value['owner'] ? 'owner_${contact}' : contact;
      _result.businessHours = _businessHour;
      if (_businessHour != null) {
        _result.businessHours.forEach((bh) {
          bh.id = 0;
        });
      }

      _result.address = _address?.address;
      _result.flags = fbKey.currentState.value['features'];
      _uploading = true;
      var result = json.encode(_result);
      App.http.addPlace(_result).then((newPlace) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => AddPlaceSubmitPage(
                  createdPlace: newPlace,
                ),
            fullscreenDialog: true));
      }).catchError((onError) {
        _uploading = true;
      });
    }
  }

  @override
  dispose() {
    _addressController.dispose();
    super.dispose();
  }

  void showPlacePicker(LatLng initPosition) async {
    NearbyAddress result = await Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => PlacePicker(kGoogleApiKey, initPosition)));

    // Handle the result in your way
    print(result);
    setState(() {
      _address = result;
      if (result == null) {
        invalidAddress = true;
      } else {
        invalidAddress = false;
      }
    });
  }

  void showOpeningHourPicker() async {
    List<EditablkeBusinessHour> result =
        await Navigator.of(context).push(MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => OpeningHoursPage(
                  businessHours: _businessHour,
                )));

    // Handle the result in your way
    print(result);
    setState(() {
      _businessHour = result;
    });
  }
}
