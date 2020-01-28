import 'package:app/Helpers/place_helper.dart';
import 'package:app/components/Common/leading_icon.dart';
import 'package:app/components/Places/open_dropdown.dart';
import 'package:app/components/Socials/socials_widget.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceInfo extends StatefulWidget {
  final PlaceSimpleDto place;
  final PlaceDto placeInfo;
  const PlaceInfo({Key key, this.place, this.placeInfo}) : super(key: key);

  @override
  _PlaceInfoState createState() => _PlaceInfoState();
}

class _PlaceInfoState extends State<PlaceInfo> {
  bool isOpen = false;

  @override
  void initState() {
    isOpen = PlaceHelpers.isOpen(widget.place);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.place == null
        ? SizedBox(
            child: CircularProgressIndicator(),
            width: 50.0,
            height: 50.0,
          )
        : Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new LeadingIcon(
                  color: getColor(),
                  icon: Icons.watch,
                  child: OpenDropdown(
                    place: widget.place,
                    dark: false,
                  )),
              widget.place.phoneNumber != null
                  ? InkWell(
                      onTap: () => launch('tel://${widget.place.phoneNumber}'),
                      child: new LeadingIcon(
                        icon: Icons.phone,
                        child: Text(
                          widget.place.phoneNumber,
                          style: Theme.of(context).textTheme.bodyText2.apply(color: Colors.black),
                        ),
                      ),
                    )
                  : Container(),
              SocialsList(socials: widget.placeInfo?.socialMedias)
            ],
          );
  }

  MaterialColor getColor() {
    if (isOpen == null) {
      return Colors.grey;
    }
    return isOpen ? Colors.green : Colors.red;
  }
}
