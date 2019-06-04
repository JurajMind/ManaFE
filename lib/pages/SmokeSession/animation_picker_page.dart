import 'package:flutter/material.dart';

import 'Components/animation_list.dart';

class AnimationPickerPage extends StatefulWidget {
  @override
  _AnimationPickerPageState createState() => _AnimationPickerPageState();
}

class _AnimationPickerPageState extends State<AnimationPickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select animations'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child:    AnimationsPicker(),
      ),
    );
  }
}