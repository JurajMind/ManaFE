import 'package:app/components/Places/place_flag.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/support/mana_icons_icons.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/api.dart';

class ExtraPlaceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var placeBloc = DataProvider.getData(context).placeSingleBloc;
    return Container(
      child: Column(
        children: <Widget>[
          StreamBuilder<PlaceDto>(
              stream: placeBloc.placeInfo,
              builder: (context, snapshot) {
                var lang = AppTranslations.of(context).currentLanguage;
                if (snapshot.data == null) {
                  return Container();
                }
                return Column(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: new Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FractionallySizedBox(
                          widthFactor: 1,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.info,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                      snapshot.data.description[lang] ??
                                          'No description',
                                      style:
                                          Theme.of(context).textTheme.headline5),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ]);
              }),
          SizedBox(
            height: 16,
          ),
          Text(
            'By manapipes:',
            style: Theme.of(context).textTheme.headline5,
          ),
          StreamBuilder<PlaceDto>(
              stream: placeBloc.placeInfo,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container();
                } else {
                  return Column(children: [
                    Wrap(
                      children: <Widget>[
                        ManaFlag(
                          icon: ManaIcons.manam,
                          feature: "Mana device",
                          haveFeature: snapshot.data.haveMana,
                          color: AppColors.colors[1],
                        ),
                        ManaFlag(
                            icon: FontAwesomeIcons.columns,
                            feature: "Online reservation",
                            haveFeature: snapshot.data.haveReservation,
                            color: AppColors.colors[2]),
                        ManaFlag(
                            icon: FontAwesomeIcons.calendarAlt,
                            feature: "Online menu",
                            haveFeature: snapshot.data.haveMenu,
                            color: AppColors.colors[3]),
                      ],
                    ),
                    Text(
                      'By ${snapshot.data.name}:',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Wrap(
                      children: snapshot.data.flags
                          .map((f) => new PlaceFlag(f))
                          .toList(),
                    )
                  ]);
                }
              }),
        ],
      ),
    );
  }
}

class ManaFlag extends StatelessWidget {
  final IconData icon;
  final bool haveFeature;
  final String feature;
  final Color color;
  const ManaFlag(
      {Key key,
      this.icon,
      this.haveFeature,
      this.feature,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Tooltip(
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: new Border.all(color: Colors.white, width: 2),
            borderRadius: new BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, color: color),
              SizedBox(
                width: 8,
              ),
              Text(feature)
            ],
          ),
        ),
        message: "Place have ${feature.toLowerCase()}",
      ),
    );
  }
}
