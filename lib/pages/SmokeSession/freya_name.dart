
import 'package:flutter/material.dart';

class FreyaName extends StatelessWidget {
  const FreyaName({Key? key, required Size screenSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: FractionallySizedBox(
            widthFactor: 0.5,
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/freya_meno.png',
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
