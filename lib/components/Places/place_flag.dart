import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaceFlag extends StatelessWidget {
  final String flag;
  const PlaceFlag(
    this.flag, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Tooltip(
        child: Chip(
          label: flagToIcon(context),
        ),
        message: "Place have ${flag.toLowerCase()}",
      ),
    );
  }

  Widget flagToIcon(BuildContext context) {
    switch (flag) {
      case "CARD":
        return Icon(Icons.credit_card);
        break;
      case "WIFI":
        return Icon(Icons.wifi);
        break;
      case "CASH":
        return Icon(Icons.attach_money);
        break;
      case "PET":
        return Icon(Icons.pets);
        break;
      case "FOOD":
        return Icon(FontAwesomeIcons.utensils);
        break;
      default:
        return Text(
          flag,
          style: Theme.of(context).textTheme.body1.apply(color: Colors.black),
        );
    }
  }
}
