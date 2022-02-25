import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/Places/Reservations/reservations_page.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:darq/darq.dart';

class ReservationButton extends StatelessWidget {
  const ReservationButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var reservationsBloc = DataProvider.getData(context).reservationBloc;

    return Container(
        child: StreamBuilder<List<PlacesReservationsReservationDto>>(
            stream: reservationsBloc.reservations,
            builder: (context, snapshot) {
              var upcomingCount = 0;
              if (snapshot.data != null) {
                var toDate = DateTime.now().add(new Duration(days: 7));
                var upcomingReservations = snapshot.data;
                upcomingCount = upcomingReservations
                    .where((predicate) =>
                        predicate.time.compareTo(DateTime.now()) > 0 &&
                        predicate.time.compareTo(toDate) < 0 &&
                        predicate.status != 1)
                    .orderBy((p) => p.time)
                    .count();
              }

              return OutlineButton.icon(
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                borderSide: BorderSide(color: Colors.white),
                icon: Container(
                  child: Center(
                    child: Text(upcomingCount.toString(), style: Theme.of(context).textTheme.bodyText2),
                  ),
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.colors[2]),
                ),
                label: upcomingCount == -1
                    ? Text(
                        'All reservations',
                        style: Theme.of(context).textTheme.bodyText2,
                      )
                    : Text(
                        AppTranslations.of(context).text("reservations.upcoming_reservations") + " ",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
                  return new ReservationsPage();
                })),
              );
            }));
  }
}
