import 'package:app/module/general/gear_bloc.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/person/person_bloc.dart';
import 'package:app/module/person/reservations_bloc.dart';
import 'package:app/module/person/statistic_bloc.dart';
import 'package:app/module/places/menu_bloc.dart';
import 'package:app/module/places/place_bloc.dart';
import 'package:app/module/places/places_bloc.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:flutter/cupertino.dart';

import 'general/app_bloc.dart';

class DataProvider extends InheritedWidget {
  final MixologyBloc mixologyBloc;
  final SmokeSessionBloc smokeSessionBloc;
  final PlacesBloc placeBloc;
  final MenuBloc menuBloc;
  final PersonBloc personBloc;
  final GearBloc gearBloc;
  final PlaceBloc placeSingleBloc;
  final StatisticBloc statisticBloc;
  final ReservationBloc reservationBloc;
  final AppBloc appBloc;

  DataProvider({
    Key key,
    Widget child,
  })  : mixologyBloc = new MixologyBloc(),
        smokeSessionBloc = new SmokeSessionBloc(),
        placeBloc = new PlacesBloc(),
        personBloc = new PersonBloc(),
        gearBloc = new GearBloc(),
        menuBloc = new MenuBloc(),
        placeSingleBloc = new PlaceBloc(),
        statisticBloc = new StatisticBloc(),
        reservationBloc = new ReservationBloc(),
        appBloc = new AppBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MixologyBloc getMixology(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DataProvider>().mixologyBloc;

  static SmokeSessionBloc getSmokeSession(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<DataProvider>()
      .smokeSessionBloc;

  static PlacesBloc getPlaces(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DataProvider>().placeBloc;

  static DataProvider getData(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DataProvider>();
}
