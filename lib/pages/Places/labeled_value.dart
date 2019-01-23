import 'package:flutter/material.dart';

class LabeledValue extends StatelessWidget  {
  final String label;
  final String value;

  const LabeledValue({Key key, this.label, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(label,style:Theme.of(context).copyWith(textTheme:TextTheme(title: TextStyle(color: Colors.black))).textTheme.title ,),
      Text(value,style:Theme.of(context).copyWith(textTheme:TextTheme(title: TextStyle(color: Colors.black))).textTheme.title ,),
    ]);
  }

}