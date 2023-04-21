import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaceFlag extends StatelessWidget {
  final String flag;
  const PlaceFlag(
    this.flag, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Tooltip(
        child: Container(
          padding: EdgeInsets.all(8),
          width: 100,
          decoration: BoxDecoration(
            border: new Border.all(color: Colors.white, width: 2),
            borderRadius: new BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              flagToIcon(context),
              SizedBox(
                width: 8,
              ),
              Text(flag)
            ],
          ),
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
      case "OUTDOOR":
        return Icon(FontAwesomeIcons.tree);
        break;
      case "CASH":
        return Icon(FontAwesomeIcons.moneyBill);
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
          style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
        );
    }
  }
}
