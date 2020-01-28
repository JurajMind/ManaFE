import 'package:app/Helpers/type_helper.dart';
import 'package:app/components/Places/navigate_button.dart';
import 'package:app/components/Places/place_detail.dart';
import 'package:app/components/Places/place_map.dart';
import 'package:app/const/theme.dart';
import 'package:app/models/extensions.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class AddPlaceSubmitPage extends StatefulWidget {
  final PlaceDto createdPlace;
  const AddPlaceSubmitPage({Key key, this.createdPlace}) : super(key: key);

  @override
  _AddPlaceSubmitPageState createState() => _AddPlaceSubmitPageState();
}

class _AddPlaceSubmitPageState extends State<AddPlaceSubmitPage> {
  PlaceSimpleDto simplePlace;
  @override
  @override
  void initState() {
    super.initState();
    simplePlace = toSimpePlace(widget.createdPlace);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(tag: 'add_new_place_label', child: Text('Place added')),
        backgroundColor: AppColors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Thank you!',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              '${widget.createdPlace.name} will be added to database after our review',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(const Radius.circular(40.0)),
              ),
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(simplePlace.name, style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.black))),
                    Text(Extensions.adress(simplePlace.address), style: Theme.of(context).textTheme.headline5.merge(TextStyle(color: Colors.black))),
                    new Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PlaceInfo(place: simplePlace),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                            flex: 1,
                            child: PlaceMap(
                              place: simplePlace,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
