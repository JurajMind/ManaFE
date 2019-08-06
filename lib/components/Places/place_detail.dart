import 'package:app/Helpers/place_helper.dart';
import 'package:app/components/Common/leading_icon.dart';
import 'package:app/components/Places/open_dropdown.dart';
import 'package:app/const/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                          style: Theme.of(context).textTheme.display3.apply(color: Colors.black),
                        ),
                      ),
                    )
                  : Container(),
              PlaceSocials(place: widget.placeInfo)
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

class PlaceSocials extends StatelessWidget {
  final PlaceDto place;
  const PlaceSocials({Key key, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (place == null) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        child: Row(
      
          children: <Widget>[
            ...place.socialMedias.map((f) {
              return this.socialWidget(f,context);
            }).toList()
          ],
        ),
      ),
    );
  }

  Widget socialWidget(SmartHookahModelsDbSocialMedia f,BuildContext context) {
    IconData icon = Icons.battery_unknown;
    Color color = Colors.red;
    LinearGradient gradient;
    switch (f.code) {
      case "FB":
        {
          icon = FontAwesomeIcons.facebook;
          color = const Color.fromRGBO(59, 89, 152, 1);
          break;
        }
      case "IG":
        {
          icon = FontAwesomeIcons.instagram;
          gradient = const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                const Color.fromRGBO(64, 93, 230, 1),
                const Color.fromRGBO(88, 81, 219, 1),
                const Color.fromRGBO(253, 29, 29, 1),
                const Color.fromRGBO(255, 220, 128, 1)
              ]);
          break;
        }
      case "URL":
        {
          icon = FontAwesomeIcons.link;
          color = AppColors.colors[2];
          break;
        }
      case "MSG":
        {
          icon = FontAwesomeIcons.facebookMessenger;
          color = Color.fromRGBO(0, 120, 255, 1);
          break;
        }
    }

    return InkWell(
      child: Container(       
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Icon(icon,color: color,),
            
          ],
        ),
      ),
    );
  }
}
