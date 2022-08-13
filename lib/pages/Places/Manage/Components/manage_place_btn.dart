import 'package:app/main.dart';
import 'package:app/module/module.dart';
import 'package:app/pages/Places/Manage/manage_place.page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/openapi.dart';

import '../manage_place_cross.page.dart';

class ManagePlaceBtn extends StatelessWidget {
  const ManagePlaceBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = getIt.get<PersonBloc>();
    return Container(
      child: StreamBuilder<PersonInfoDto>(
          stream: bloc.info,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container();
            }

            if (snapshot.data!.managedPlaces == null || snapshot.data!.managedPlaces!.length == 0) return Container();

            return FloatingActionButton(
              child: Icon(FontAwesomeIcons.building),
              onPressed: () {
                if (snapshot.data!.managedPlaces!.length > 1) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ManagePlaceCrossPage(
                            managedPlaces: snapshot.data!.managedPlaces,
                          )));
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ManagePlacePage(
                            place: snapshot.data!.managedPlaces!.first,
                          )));
                }
              },
            );
          }),
    );
  }
}
