import 'package:app/app/app.dart';
import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/module.dart';
import 'package:app/module/places/place_bloc.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import 'manage_reservation.page.dart';

class ManagePlacePage extends StatefulWidget {
  final PlaceSimpleDto? place;
  ManagePlacePage({Key? key, this.place}) : super(key: key);

  @override
  _ManagePlacePageState createState() => _ManagePlacePageState();
}

class _ManagePlacePageState extends State<ManagePlacePage> {
  PlaceBloc placeBloc = getIt.get<PlaceBloc>();

  @override
  initState() {
    super.initState();
  }

  PlaceSimpleDto? place;
  @override
  Future didChangeDependencies() async {
    super.didChangeDependencies();
    if (placeBloc == null) {
      placeBloc = getIt.get<PlaceBloc>();
    }
    await placeBloc.loadPlace(placeId: widget.place!.id);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('${widget.place!.name}'),
            bottom: TabBar(tabs: [
              Tab(
                text: "Reservations",
              ),
              Tab(text: "Persistent"),
            ]),
          ),
          body: Center(
            child: Container(
                child: Container(
              child: StreamBuilder<PlaceDto?>(
                  stream: placeBloc.placeInfo,
                  builder: (context, snapshot) {
                    return snapshot.data == null
                        ? CircularProgressIndicator()
                        : Container(
                            child: TabBarView(
                              children: [
                                ManageReservationPage(place: snapshot.data),
                                ManageReservationPage(place: snapshot.data),
                              ],
                            ),
                          );
                  }),
            )),
          )),
    );
  }
}
