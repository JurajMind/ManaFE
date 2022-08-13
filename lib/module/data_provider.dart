import 'package:app/module/general/gear_bloc.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/person/reservations_bloc.dart';
import 'package:app/module/person/statistic_bloc.dart';
import 'package:app/module/places/menu_bloc.dart';
import 'package:flutter/cupertino.dart';

import 'general/app_bloc.dart';

class DataProvider extends InheritedWidget {
  final MixologyBloc mixologyBloc;

  final MenuBloc menuBloc;

  final GearBloc gearBloc;

  final StatisticBloc statisticBloc;
  final ReservationBloc reservationBloc;
  final AppBloc appBloc;

  DataProvider({
    Key? key,
    required Widget child,
  })  : mixologyBloc = new MixologyBloc(),
        gearBloc = new GearBloc(),
        menuBloc = new MenuBloc(),
        statisticBloc = new StatisticBloc(),
        reservationBloc = new ReservationBloc(),
        appBloc = new AppBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MixologyBloc getMixology(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DataProvider>()!.mixologyBloc;

  static DataProvider? getData(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DataProvider>();
}
