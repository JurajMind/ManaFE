import 'dart:convert';
import 'dart:io';

import 'package:app/app/app.dart';
import 'package:app/components/Places/PlacePicker/address_picker.dart';
import 'package:app/components/Places/PlacePicker/place_picker.dart';
import 'package:app/components/Places/open_dropdown.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/theme/theme_widget.dart';
import 'package:app/utils/translations/app_translations.dart';
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

    var theme = MTheme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Hero(
              tag: 'add_new_place_label',
              child: Text(
                  AppTranslations.of(context)
                      .text("reservations.add_new_place"),
                  style: theme.appBarStyle)),
          backgroundColor: AppColors.black,
          centerTitle: true,
        ),
        body: Placeholder());
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
      App.http.addPlace(_result).then((newPlace) async {
        if (_image != null) {
          await App.http.uploadPlacePicture(newPlace.id, _image);
        }
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
