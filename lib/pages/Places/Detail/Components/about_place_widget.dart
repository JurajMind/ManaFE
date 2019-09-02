
import 'package:app/components/Places/navigate_button.dart';
import 'package:app/components/Places/place_detail.dart';
import 'package:app/components/Places/place_map.dart';
import 'package:app/components/Places/taxi_button.dart';
import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

import '../../place_detail_page.dart';

class AboutPlaceWidget extends StatelessWidget {
  final PlaceSimpleDto place;

  const AboutPlaceWidget({Key key, this.place}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var placeBloc = DataProvider.getData(context).placeSingleBloc;
    return Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                StreamBuilder<PlaceDto>(
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
                      SizedBox(height: 20,),
                      Container(
                         decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: new BookMenuWidget(
                                placeBloc: placeBloc,
                                place: place,                                
                              ),
                      ),
                        SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
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