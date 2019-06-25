import 'package:app/const/theme.dart';
import 'package:flutter/material.dart';

class AddPlacePage extends StatefulWidget {
  AddPlacePage({Key key}) : super(key: key);

  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new place'),
        backgroundColor: AppColors.black,
        centerTitle: true,
      ),
    );
  }
}
