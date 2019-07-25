import 'package:app/app/app.dart';
import 'package:app/models/App/Gear/gear_model.dart';
import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

import 'brand_select_page.dart';

class AddGearPage extends StatefulWidget {
  AddGearPage({Key key}) : super(key: key);

  _AddGearPageState createState() => _AddGearPageState();
}

class _AddGearPageState extends State<AddGearPage> {
  BrandGroup selectedBrand;
  String selectedType = "None";
  var types = ["None", "Tobacco", "Hookah", "Bowl", "HeatManagement", "Coal"];
  String newName = "";

  bool uploading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new gear')),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Brand:',
                    style: Theme.of(context).textTheme.display2,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Text(
                      selectedBrand == null
                          ? 'select brand'
                          : selectedBrand.name,
                      style: Theme.of(context).textTheme.display2,
                    ),
                    onTap: () {
                      selectBrand(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => selectBrand(context),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Type:',
                  style: Theme.of(context).textTheme.display2,
                ),
                SizedBox(
                  width: 20,
                ),
                new DropdownButton(
                  iconSize: 20,
                  value: selectedType,
                  items: types.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(
                        value,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedType = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Name:',
                  style: Theme.of(context).textTheme.display2,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 200,
                  child: TextField(
                    onChanged: (name) {
                      setState(() {
                        this.newName = name;
                      });
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter new gear name'),
                  ),
                ),
              ],
            ),
            OutlineButton.icon(
              icon: Icon(Icons.save),
              label: uploading
                  ? CircularProgressIndicator()
                  : Text('Use new brand'),
              onPressed: () {
                setState(() {
                  uploading = true;
                });
                var newGear = new PipeAccesorySimpleDto();
                newGear.name = newName;
                newGear.type = selectedType;
                newGear.brand = selectedBrand.name;
                newGear.brandId = selectedBrand.id;

                var bloc = DataProvider.getData(context).gearBloc;
                bloc.addGear(newGear).then((createdGear) {
                  Navigator.of(context).pop(createdGear);
                });
              },
            )
          ],
        ),
      ),
    );
  }

  void selectBrand(BuildContext context) {
    Navigator.of(context)
        .push<BrandGroup>(MaterialPageRoute(
            builder: (context) => BrandSelectPage(), fullscreenDialog: true))
        .then((selectedBrand) {
      setState(() {
        this.selectedBrand = selectedBrand;
      });
    });
  }
}
