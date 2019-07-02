import 'package:app/const/theme.dart';
import 'package:flutter/material.dart';

class AddPlaceSubmitPage extends StatelessWidget {
  const AddPlaceSubmitPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(tag: 'add_new_place_label', child: Text('Place added')),
        backgroundColor: AppColors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('Thank you!')],
        ),
      ),
    );
  }
}
