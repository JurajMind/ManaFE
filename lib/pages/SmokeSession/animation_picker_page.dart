import 'package:app/utils/translations/app_translations.dart';
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
        title: Text(
          AppTranslations.of(context)!
              .text("smoke_session.animation")
              .toUpperCase(),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: AnimationsPicker(),
      ),
    );
  }
}
