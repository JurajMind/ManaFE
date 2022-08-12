import 'package:app/const/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/openapi.dart';

class SocialsList extends StatelessWidget {
  final List<SmartHookahModelsDbSocialMedia>? socials;
  const SocialsList({Key? key, this.socials}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (socials == null) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ...socials!.map((f) {
              return this.socialWidget(f, context);
            }).toList()
          ],
        ),
      ),
    );
  }

  Widget socialWidget(SmartHookahModelsDbSocialMedia f, BuildContext context) {
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
          gradient = const LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
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
            Icon(
              icon,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
