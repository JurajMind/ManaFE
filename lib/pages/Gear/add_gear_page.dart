import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/models/App/Gear/gear_model.dart';
import 'package:app/module/general/gear_bloc.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

import 'brand_select_page.dart';

class AddGearPage extends StatefulWidget {
  final String selectedType;
  final String pretypedName;
  final GearBloc bloc;
  AddGearPage({Key key, this.selectedType, this.pretypedName, this.bloc}) : super(key: key);

  _AddGearPageState createState() => _AddGearPageState();
}

class _AddGearPageState extends State<AddGearPage> {
  @override
  initState() {
    if (widget.selectedType != null) {
      selectedType = widget.selectedType;
    }
    if (widget.pretypedName != null) {
      controller = new TextEditingController(text: widget.pretypedName);
    } else {
      controller = new TextEditingController();
    }
    super.initState();
  }

  BrandGroup selectedBrand;
  String selectedType = "None";
  var types = ["None", "Tobacco", "Hookah", "Bowl", "HeatManagement", "Coal"];
  String newName = "";
  TextEditingController controller;

  bool uploading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppTranslations.of(context).text("gear.add_new_gear"))),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppTranslations.of(context).text("gear.brand") + " :",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Text(
                      selectedBrand == null ? 'select brand' : selectedBrand.name,
                      style: Theme.of(context).textTheme.headline5,
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
                  AppTranslations.of(context).text("gear.type") + " :",
                  style: Theme.of(context).textTheme.headline5,
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
                  AppTranslations.of(context).text("gear.name") + " :",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 200,
                  child: TextField(
                    controller: controller,
                    onChanged: (name) {
                      setState(() {
                        this.newName = name;
                      });
                    },
                    decoration: InputDecoration(border: InputBorder.none, hintText: AppTranslations.of(context).text("gear.enter_new_gear_name")),
                  ),
                ),
              ],
            ),
            MButton(
              icon: Icons.save,
              uploading: uploading,
              label: AppTranslations.of(context).text('gear.save_and_use_new_gear'),
              onPressed: () {
                if (selectedBrand == null || selectedType == "None" || newName == null) {
                  return;
                }

                setState(() {
                  uploading = true;
                });
                var newGear = new PipeAccesorySimpleDto();
                newGear.name = newName;
                newGear.type = selectedType;
                newGear.brand = selectedBrand.name;
                newGear.brandId = selectedBrand.id;

                widget.bloc.addGear(newGear).then((createdGear) {
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
    Navigator.of(context).push<BrandGroup>(MaterialPageRoute(builder: (context) => BrandSelectPage(widget.bloc), fullscreenDialog: true)).then((selectedBrand) {
      setState(() {
        this.selectedBrand = selectedBrand;
      });
    });
  }
}
