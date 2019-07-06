import 'dart:io';

import 'package:app/components/Places/PlacePicker/place_picker.dart';
import 'package:app/components/Places/open_dropdown.dart';
import 'package:app/const/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  NearbyAddress _address;
  List<EditablkeBusinessHour> _businessHour;
  TextEditingController _addressController;
  File _image;
  PlaceDto _result;

  bool invalidAddress = false;

  @override
  Widget build(BuildContext context) {
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
              key: _fbKey,
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
                    keyboardType: TextInputType.number,
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
                              Text('Address',
                                  style: new TextStyle(
                                      fontSize: 16,
                                      color: invalidAddress
                                          ? Colors.red
                                          : Colors.grey)),
                              SizedBox(height: 5),
                              Text(_address?.name ??
                                  (invalidAddress
                                      ? "Adress cannot be empty"
                                      : "No address"))
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(Icons.map),
                            onPressed: () async {
                              showPlacePicker();
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
                    decoration: InputDecoration(labelText: "Place features"),
                    attribute: "features",
                    initialValue: ["CASH"],
                    options: [
                      FormBuilderFieldOption(
                          value: "WIFI", label: "Have this place Wi-Fi?"),
                      FormBuilderFieldOption(
                          value: "CARD", label: "Can pay with credit card?"),
                      FormBuilderFieldOption(
                          value: "CASH", label: "Can pay with cash?"),
                      FormBuilderFieldOption(
                          value: "FOOD", label: "Can you order food?"),
                      FormBuilderFieldOption(
                          value: "PET", label: "Can you bring your pet here?"),
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
            Row(
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
                    _fbKey.currentState.reset();
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
    _fbKey.currentState.save();
    if (_fbKey.currentState.validate()) {
      if (_address == null) {
        setState(() {
          invalidAddress = true;
          return;
        });
      }
      print(_fbKey.currentState.value);

      _result = new PlaceDto();
      _result.name = _fbKey.currentState.value['name'];
      _result.phoneNumber = _fbKey.currentState.value['phoneNumber'];
      _result.businessHours = _businessHour;
      _result.address = _address?.address;
      _result.flags = _fbKey.currentState.value['features'];
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => AddPlaceSubmitPage(
                createdPlace: _result,
              ),
          fullscreenDialog: true));
    }
  }

  @override
  dispose() {
    _addressController.dispose();
    super.dispose();
  }

  void showPlacePicker() async {
    NearbyAddress result = await Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => PlacePicker(
              kGoogleApiKey,
            )));

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
