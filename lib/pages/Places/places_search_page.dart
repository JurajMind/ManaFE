import 'package:app/components/Places/place_item.dart';
import 'package:app/const/theme.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class PlacesSearchPage extends StatefulWidget {
  final List<PlaceSimpleDto> places;
  PlacesSearchPage({Key key, this.places}) : super(key: key);

  _PlacesSearchPageState createState() => _PlacesSearchPageState();
}

class _PlacesSearchPageState extends State<PlacesSearchPage> {
  BehaviorSubject<List<PlaceSimpleDto>> places;

  @override
  initState() {
    super.initState();
    places = new BehaviorSubject.seeded(widget.places);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(16.0)),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: <Widget>[
                                      Flexible(child: Icon(Icons.search)),
                                      Expanded(
                                          child: TextFormField(
                                        decoration: InputDecoration(
                                            disabledBorder:
                                                OutlineInputBorder()),
                                      )),
                                    ],
                                  )),
                              Container(height: 1, color: Colors.white),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: IconButton(
                                        icon: Icon(Icons.place),
                                      ),
                                    ),
                                    Container(width: 1, color: Colors.white),
                                    Expanded(
                                        child: TextFormField(
                                      initialValue: "Curent location",
                                    )),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 11,
              child: StreamBuilder<List<PlaceSimpleDto>>(
                  stream: this.places,
                  builder: (context, snapshot) {
                    return snapshot.data == null
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              var data = snapshot.data[index];
                              return new PlaceItem(place: data);
                            },
                          );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
