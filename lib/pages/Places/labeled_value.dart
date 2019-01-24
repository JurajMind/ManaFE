import 'package:flutter/material.dart';

class LabeledValue extends StatelessWidget {
  final String label;
  final String value;

  const LabeledValue({Key key, this.label, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: Theme.of(context)
                    .copyWith(
                        textTheme: TextTheme(
                            title: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700)))
                    .textTheme
                    .title,
              ),
              Text(
                value,
                style: Theme.of(context)
                    .copyWith(
                        textTheme:
                            TextTheme(title: TextStyle(color: Colors.black)))
                    .textTheme
                    .title,
              ),
            ]),
      ),
    );
  }
}
