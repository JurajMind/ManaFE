import 'package:app/components/Places/navigate_button.dart';
import 'package:app/components/Places/place_detail.dart';
import 'package:app/components/Places/place_map.dart';
import 'package:app/components/Places/taxi_button.dart';
import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/module.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import '../../place_detail_page.dart';

class AboutPlaceWidget extends StatelessWidget {
  final PlaceSimpleDto? place;

  const AboutPlaceWidget({Key? key, this.place}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var placeBloc = getIt.get<PlaceBloc>();
    return Column(
      children: <Widget>[
        StreamBuilder<PlaceDto?>(
            stream: placeBloc.placeInfo,
            builder: (context, snapshot) {
              var lang = AppTranslations.of(context)!.currentLanguage;
              if (snapshot.data == null) {
                return Container();
              }
              return Column(children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
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
                              color: Colors.black,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  snapshot.data!.shortDescriptions![lang] ?? 'No description',
                                  style: Theme.of(context).textTheme.headline5!.apply(color: Colors.black),
                                ),
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
        Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  StreamBuilder<PlaceDto?>(
                      stream: placeBloc.placeInfo,
                      builder: (context, snapshot) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PlaceInfo(
                              place: place,
                              placeInfo: snapshot.data,
                            ),
                          ),
                          flex: 1,
                        );
                      }),
                  Expanded(
                      flex: 1,
                      child: PlaceMap(
                        place: place,
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          child: new BookMenuWidget(
            placeBloc: placeBloc,
            place: place,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NavigateButton(
                place: place,
              ),
              Container(
                height: 14.0,
                width: 2.0,
                color: Colors.grey,
              ),
              TaxiButton(
                place: place,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
