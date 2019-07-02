import 'package:app/const/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'add_place_submit_page.dart';

class AddPlacePage extends StatefulWidget {
  AddPlacePage({Key key}) : super(key: key);

  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

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
                    maxLines: 2,
                    attribute: "description",
                    decoration: InputDecoration(labelText: "Short description"),
                    validators: [],
                  ),
                  FormBuilderTextField(
                    maxLines: 2,
                    attribute: "longDescription",
                    decoration: InputDecoration(labelText: "Long description"),
                    validators: [],
                  ),
                  FormBuilderTextField(
                    attribute: "phoneNumber",
                    decoration: InputDecoration(labelText: "Phone number"),
                    validators: [],
                    keyboardType: TextInputType.number,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: FormBuilderTextField(
                          attribute: "address",
                          decoration: InputDecoration(labelText: "Address"),
                          validators: [],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(Icons.map),
                      )
                    ],
                  )
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
                    _fbKey.currentState.save();
                    if (_fbKey.currentState.validate()) {
                      print(_fbKey.currentState.value);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => AddPlaceSubmitPage(),
                          fullscreenDialog: true));
                    }
                  },
                ),
                MaterialButton(
                  child: Text("Reset"),
                  onPressed: () {
                    _fbKey.currentState.reset();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
