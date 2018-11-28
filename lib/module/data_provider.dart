import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/places/places_bloc.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:flutter/cupertino.dart';

class DataProvider extends InheritedWidget {
  final MixologyBloc mixologyBloc;
  final SmokeSessionBloc smokeSessionBloc;
  final PlacesBloc placeBloc;

  DataProvider({
    Key key,
    @required MixologyBloc mixology,
    @required SmokeSessionBloc smokeSession,
    @required PlacesBloc place,
    Widget child,
  })  : assert(mixology != null),
        mixologyBloc = mixology,
        smokeSessionBloc = smokeSession,
        placeBloc = place,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MixologyBloc getMixology(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(DataProvider) as DataProvider)
          .mixologyBloc;

  static SmokeSessionBloc getSmokeSession(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(DataProvider) as DataProvider)
          .smokeSessionBloc;

  static PlacesBloc getPlaces(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(DataProvider) as DataProvider)
          .placeBloc;
}

class AppBloc {}
