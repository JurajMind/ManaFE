import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LabeledValue extends StatelessWidget {
  final String? label;
  final String? value;
  final Icon? icon;
  final EdgeInsetsGeometry? padding;

  const LabeledValue(this.value, {Key? key, this.label, this.icon, this.padding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: Flex(direction: Axis.horizontal, mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        icon == null ? Container() : Padding(padding: EdgeInsets.only(right: 4), child: icon),
        label == null
            ? Container()
            : Text(
                label ?? '',
                style: Theme.of(context).copyWith(textTheme: TextTheme(headline4: TextStyle(fontWeight: FontWeight.w700, fontSize: 16))).textTheme.headline4,
              ),
        AutoSizeText(
          value ?? '',
          maxLines: 1,
          minFontSize: 10,
          maxFontSize: 16,
        ),
      ]),
    );
  }
}
