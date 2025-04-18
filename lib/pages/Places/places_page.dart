import 'package:app/app/app.dart';
import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/components/Places/place_item.dart';
import 'package:app/components/Reservations/reservation_item.dart';
import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/module.dart';
import 'package:app/pages/Places/Reservations/reservations_page.dart';
import 'package:app/pages/Places/places_map_page.dart';
import 'package:app/pages/Places/places_search_page.dart';
import 'package:app/utils/Map/location.dart';
import 'package:app/utils/Map/map_view_type.dart';
import 'package:app/utils/Map/marker.dart';
import 'package:app/utils/Map/static_map_provider.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:openapi/openapi.dart';
import 'package:darq/darq.dart';
import 'package:rxdart/rxdart.dart';

class PlacesPage extends StatefulWidget {
  @override
  State<PlacesPage> createState() {
    return new _PlacesPageState();
  }
}

class _PlacesPageState extends State<PlacesPage> {
  var staticMapProvider = new StaticMapProvider(App.googleApiKeys);

  Location? myUserLocation;
  PlacesBloc placesBloc = getIt.get<PlacesBloc>();
  PlaceBloc placeBloc = getIt.get<PlaceBloc>();
  PersonBloc personBloc = getIt.get<PersonBloc>();

  @override
  initState() {
    super.initState();
    myUserLocation = new Location(50.08804, 14.42076);
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 2;

//https://maps.googleapis.com/maps/api/staticmap?center=${myUserLocation.altitude},${myUserLocation.longitude}&zoom=15&format=png&maptype=roadmap&style=element:geometry%7Ccolor:0x1d2c4d&style=element:labels.text.fill%7Ccolor:0x8ec3b9&style=element:labels.text.stroke%7Ccolor:0x1a3646&style=feature:administrative.country%7Celement:geometry.stroke%7Ccolor:0x4b6878&style=feature:administrative.land_parcel%7Celement:labels.text.fill%7Ccolor:0x64779e&style=feature:administrative.province%7Celement:geometry.stroke%7Ccolor:0x4b6878&style=feature:landscape.man_made%7Celement:geometry.stroke%7Ccolor:0x334e87&style=feature:landscape.natural%7Celement:geometry%7Ccolor:0x023e58&style=feature:poi%7Celement:geometry%7Ccolor:0x283d6a&style=feature:poi%7Celement:labels.text.fill%7Ccolor:0x6f9ba5&style=feature:poi%7Celement:labels.text.stroke%7Ccolor:0x1d2c4d&style=feature:poi.business%7Cvisibility:off&style=feature:poi.park%7Celement:geometry.fill%7Ccolor:0x023e58&style=feature:poi.park%7Celement:labels.text%7Cvisibility:off&style=feature:poi.park%7Celement:labels.text.fill%7Ccolor:0x3C7680&style=feature:road%7Celement:geometry%7Ccolor:0x304a7d&style=feature:road%7Celement:labels.text.fill%7Ccolor:0x98a5be&style=feature:road%7Celement:labels.text.stroke%7Ccolor:0x1d2c4d&style=feature:road.highway%7Celement:geometry%7Ccolor:0x2c6675&style=feature:road.highway%7Celement:geometry.stroke%7Ccolor:0x255763&style=feature:road.highway%7Celement:labels.text.fill%7Ccolor:0xb0d5ce&style=feature:road.highway%7Celement:labels.text.stroke%7Ccolor:0x023e58&style=feature:transit%7Celement:labels.text.fill%7Ccolor:0x98a5be&style=feature:transit%7Celement:labels.text.stroke%7Ccolor:0x1d2c4d&style=feature:transit.line%7Celement:geometry.fill%7Ccolor:0x283d6a&style=feature:transit.station%7Celement:geometry%7Ccolor:0x3a4762&style=feature:water%7Celement:geometry%7Ccolor:0x0e1626&style=feature:water%7Celement:labels.text.fill%7Ccolor:0x4e6d70&size=900x500&key${App.googleApiKeys}

    var reservationBloc = DataProvider.getData(context)!.reservationBloc;
    return Scaffold(
      bottomNavigationBar: SizedBox(height: 45),
      body: SafeArea(
        top: false,
        child: new CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: height,
              title: Text('NEARBY PLACES'),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
                    return new PlacesSearchPage(
                      places: placesBloc.places.value,
                    );
                  })),
                )
              ],
              flexibleSpace: InkWell(
                child: new FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: StreamBuilder<Position>(
                      stream: placesBloc.location,
                      builder: (context, snapshot) {
                        return Container(height: height, child: mapBuilder(height));
                      }),
                ),
              ),
            ),
            StreamBuilder<List<PlacesReservationsReservationDto>?>(
                stream: personBloc.myReservations,
                builder: (context, snapshot) {
                  return false
                      ? Container()
                      : SliverList(
                          delegate: new SliverChildListDelegate(<Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  AppTranslations.of(context)!.text("reservations.upcoming_reservations"),
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                MButton(
                                  label: 'All reservations',
                                  onPressed: () =>
                                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
                                    return new ReservationsPage();
                                  })),
                                ),
                              ],
                            ),
                          ]),
                        );
                }),
            reservationBuilder(reservationBloc.reservations),
            placeBuilder(placesBloc.places)
          ],
        ),
      ),
    );
  }

  StreamBuilder<List<PlaceSimpleDto>> placeBuilder(BehaviorSubject<List<PlaceSimpleDto>> places) {
    return StreamBuilder(
        stream: places,
        initialData: null,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return PlaceItemShimer();
                },
                childCount: 10,
              ),
            );
          }

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _createPlaceItem(index, snapshot.data![index]);
              },
              childCount: snapshot.data == null ? 0 : snapshot.data!.length,
            ),
          );
        });
  }

  StreamBuilder<List<PlacesReservationsReservationDto>?> reservationBuilder(
      BehaviorSubject<List<PlacesReservationsReservationDto>?> reservations) {
    return StreamBuilder(
        stream: reservations,
        initialData: null,
        builder: (context, snapshot) {
          PlacesReservationsReservationDto? reservation;
          if (snapshot.data != null) {
            var upcomingReservations = new List.from(snapshot.data!);
            reservation = upcomingReservations
                .where((predicate) => predicate.time.compareTo(DateTime.now()) > 0 && predicate.status != 1)
                .orderBy((p) => p.time)
                .firstOrDefault(defaultValue: null);
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (reservation == null) {
                  return Container();
                }
                return ReservationItem(reservation: reservation);
              },
              childCount: snapshot.data == null
                  ? 0
                  : snapshot.data!.length == 0
                      ? 0
                      : 1,
            ),
          );
        });
  }

  Widget mapBuilder(double height) {
    return StreamBuilder<List<PlaceSimpleDto>>(
        stream: placesBloc.places,
        builder: (context, snapshot) {
          var markers = <Marker>[];
          if (snapshot.data != null) {
            markers = snapshot.data!
                .map((f) =>
                    Marker(f.id.toString(), f.name, double.parse(f.address!.lat!), double.parse(f.address!.lng!)))
                .toList();
          }

          return StreamBuilder<Position>(
              stream: placesBloc.location,
              initialData: null,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return CircularProgressIndicator();
                }
                var staticMapUri = staticMapProvider.getStaticUriWithMarkers(markers,
                    zoomLevel: 14,
                    center: new Location(snapshot.data!.latitude, snapshot.data!.longitude),
                    width: MediaQuery.of(context).size.width.round(),
                    height: height.round(),
                    maptype: StaticMapViewType.roadmap);

                return snapshot.data == null
                    ? CircularProgressIndicator()
                    : GestureDetector(
                        child: new Center(
                          child: new Image.network(
                            staticMapUri.toString() +
                                '&&style=element:geometry%7Ccolor:0x1d2c4d&style=element:labels.text.fill%7Ccolor:0x8ec3b9&style=element:labels.text.stroke%7Ccolor:0x1a3646&style=feature:administrative.country%7Celement:geometry.stroke%7Ccolor:0x4b6878&style=feature:administrative.land_parcel%7Celement:labels.text.fill%7Ccolor:0x64779e&style=feature:administrative.province%7Celement:geometry.stroke%7Ccolor:0x4b6878&style=feature:landscape.man_made%7Celement:geometry.stroke%7Ccolor:0x334e87&style=feature:landscape.natural%7Celement:geometry%7Ccolor:0x023e58&style=feature:poi%7Celement:geometry%7Ccolor:0x283d6a&style=feature:poi%7Celement:labels.text.fill%7Ccolor:0x6f9ba5&style=feature:poi%7Celement:labels.text.stroke%7Ccolor:0x1d2c4d&style=feature:poi.park%7Celement:geometry.fill%7Ccolor:0x023e58&style=feature:poi.park%7Celement:labels.text.fill%7Ccolor:0x3C7680&style=feature:road%7Celement:geometry%7Ccolor:0x304a7d&style=feature:road%7Celement:labels.text.fill%7Ccolor:0x98a5be&style=feature:road%7Celement:labels.text.stroke%7Ccolor:0x1d2c4d&style=feature:road.highway%7Celement:geometry%7Ccolor:0x2c6675&style=feature:road.highway%7Celement:geometry.stroke%7Ccolor:0x255763&style=feature:road.highway%7Celement:labels.text.fill%7Ccolor:0xb0d5ce&style=feature:road.highway%7Celement:labels.text.stroke%7Ccolor:0x023e58&style=feature:transit%7Celement:labels.text.fill%7Ccolor:0x98a5be&style=feature:transit%7Celement:labels.text.stroke%7Ccolor:0x1d2c4d&style=feature:transit.line%7Celement:geometry.fill%7Ccolor:0x283d6a&style=feature:transit.station%7Celement:geometry%7Ccolor:0x3a4762&style=feature:water%7Celement:geometry%7Ccolor:0x0e1626&style=feature:water%7Celement:labels.text.fill%7Ccolor:0x4e6d70&scale=2',
                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.height / 2,
                          ),
                        ),
                        onTap: () => {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => PlacesMapPage(position: snapshot.data)))
                        },
                      );
              });
        });
  }

  Widget _createPlaceItem(int index, PlaceSimpleDto data) {
    return new PlaceItem(place: data);
  }
}
