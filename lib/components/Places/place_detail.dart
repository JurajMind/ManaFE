import 'package:app/components/Common/leading_icon.dart';
import 'package:app/components/Places/open_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:openapi/api.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceInfo extends StatelessWidget {
  final PlaceSimpleDto place;

  const PlaceInfo({Key key, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return place == null
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
                  icon: Icons.watch, child: OpenDropdown(place: place)),
              place.phoneNumber != null
                  ? InkWell(
                      onTap: () => launch('tel://${place.phoneNumber}'),
                      child: new LeadingIcon(
                        icon: Icons.phone,
                        child: Text(
                          place.phoneNumber,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  : Container(),
              place.facebook != null
                  ? InkWell(
                      onTap: () => launch(place.facebook),
                      child: new LeadingIcon(
                        icon: MdiIcons.facebook,
                        child: Text(
                          place.friendlyUrl,
                          style: TextStyle(color: Colors.black),
                        ),
                      ))
                  : Container(),
            ],
          );
  }
}
