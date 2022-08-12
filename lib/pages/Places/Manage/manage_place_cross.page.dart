import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import 'manage_place.page.dart';

class ManagePlaceCrossPage extends StatefulWidget {
  final List<PlaceSimpleDto>? managedPlaces;
  ManagePlaceCrossPage({Key? key, this.managedPlaces}) : super(key: key);

  @override
  _ManagePlaceCrossPageState createState() => _ManagePlaceCrossPageState();
}

class _ManagePlaceCrossPageState extends State<ManagePlaceCrossPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose place to manage'),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemCount: widget.managedPlaces!.length,
                    itemBuilder: (context, index) {
                      var place = widget.managedPlaces![index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ManagePlacePage(
                                    place: place,
                                  )));
                        },
                        child: Container(
                          child: Center(
                            child: Text(place.name!),
                          ),
                        ),
                      );
                    }))));
  }
}
