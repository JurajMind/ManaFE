import 'dart:ui';

import 'package:flutter/material.dart';

class BigSelect extends StatelessWidget {
  final Map<int, String> labels;
  final int curentView;
  final ValueChanged<int> onSelected;
  const BigSelect({Key key, this.labels, this.curentView, this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: new ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
      child: InkWell(
        onTap: () => _showDialog(context),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(labels[curentView]),
            Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Material(
            color: Color.fromARGB(150, 0, 0, 0),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Center(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      mixTypeSelector(context, 0),
                      mixTypeSelector(context, 1),
                      mixTypeSelector(context, 2),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  InkWell mixTypeSelector(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        onSelected(index);
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Text(labels[index].toUpperCase(),
            style: Theme.of(context).textTheme.display1),
      ),
    );
  }
}
