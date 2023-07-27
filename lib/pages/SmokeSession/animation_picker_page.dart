import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';

import '../../models/SmokeSession/smoke_session.dart';
import 'Components/animation_list.dart';

class AnimationPickerPage extends StatelessWidget {
  final List<SmokeState> actions;

  const AnimationPickerPage({Key? key, required this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTranslations.of(context)!.text("smoke_session.animation").toUpperCase(),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: AnimationsPicker(
          actions: actions,
        ),
      ),
    );
  }
}
