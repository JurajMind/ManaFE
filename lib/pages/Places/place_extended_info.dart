import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import 'Detail/Components/about_place_widget.dart';
import 'Detail/Components/extra_place_widget.dart';
import 'Detail/Components/review_place_widget.dart';

class PlaceExtendedInfo extends StatefulWidget {
  final PlaceSimpleDto? place;

  const PlaceExtendedInfo({Key? key, this.place}) : super(key: key);
  @override
  _PlaceExtendedInfoState createState() => _PlaceExtendedInfoState();
}

class _PlaceExtendedInfoState extends State<PlaceExtendedInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(height: 70),
              child: TabBar(tabs: [
                Tab(
                  text: AppTranslations.of(context)!.text("place.about_place"),
                  icon: Icon(Icons.info),
                ),
                Tab(
                  text: "Extra",
                  icon: Icon(Icons.extension),
                ),
                Tab(
                  text: AppTranslations.of(context)!.text("place.reviews"),
                  icon: Icon(Icons.star_half),
                ),
              ]),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                child: TabBarView(children: [
                  AboutPlaceWidget(
                    place: widget.place,
                  ),
                  ExtraPlaceWidget(),
                  ReviewPlaceWidget(
                    place: widget.place,
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
