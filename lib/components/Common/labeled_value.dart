import 'package:flutter/material.dart';

class LabeledValue extends StatelessWidget {
  final String label;
  final String value;

  const LabeledValue({Key key, this.label, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Flex(direction: Axis.horizontal, children: <Widget>[
        Text(
          label,
          style: Theme.of(context)
              .copyWith(
                  textTheme: TextTheme(
                      title: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16)))
              .textTheme
              .title,
        ),
        Text(
          value,
          style: Theme.of(context)
              .copyWith(
                  textTheme: TextTheme(
                      title: TextStyle(color: Colors.black, fontSize: 16)))
              .textTheme
              .title,
        ),
      ]),
    );
  }
}
