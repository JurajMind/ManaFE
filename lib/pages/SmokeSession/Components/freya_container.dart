import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class FreyaContainer extends StatelessWidget {
  final Widget child;
  final bool skip;
  const FreyaContainer({Key? key, required this.child, this.skip = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (skip) {
      return child;
    }
    return Neumorphic(
      style: NeumorphicStyle(
        color: Color(0x0e0f12),
        lightSource: LightSource.topLeft,
        intensity: 0.25,
        shape: NeumorphicShape.convex,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
        border: NeumorphicBorder(
          isEnabled: true,
          color: Colors.black,
          width: 3,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
