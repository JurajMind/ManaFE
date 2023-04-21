import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../utils/translations/app_translations.dart';

class FreyaCircleButton extends StatelessWidget {
  final Widget child;
  final GestureTapCallback onPressed;
  final String? tooltip;
  const FreyaCircleButton({Key? key, required this.child, required this.onPressed, this.tooltip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(),
          shape: NeumorphicShape.convex,
          color: Colors.black54,
          depth: 2,
          shadowDarkColor: Colors.black,
          border: NeumorphicBorder(isEnabled: true, width: 1, color: Colors.black87),
        ),
        tooltip: AppTranslations.of(context)!.text("tabs.mixology"),
        child: child,
        onPressed: onPressed);
  }
}
