import 'package:app/module/data_provider.dart';
import 'package:app/pages/Places/Reservations/reservations_page.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:darq/darq.dart';

import '../../../components/Buttons/m_outlineButton.dart';

class ReservationButton extends StatelessWidget {
  const ReservationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var reservationsBloc = DataProvider.getData(context)!.reservationBloc;

    return Container(
        child: StreamBuilder<List<PlacesReservationsReservationDto>?>(
            stream: reservationsBloc.reservations,
            builder: (context, snapshot) {
              var upcomingCount = 0;
              if (snapshot.data != null) {
                var toDate = DateTime.now().add(new Duration(days: 7));
                var upcomingReservations = snapshot.data!;
                upcomingCount = upcomingReservations
                    .where((predicate) =>
                        predicate.time!.compareTo(DateTime.now()) > 0 &&
                        predicate.time!.compareTo(toDate) < 0 &&
                        predicate.status != 1)
                    .orderBy((p) => p.time)
                    .count();
              }

              return MButton(
                icon: Icons.reset_tv,
                label: upcomingCount == -1
                    ? 'All reservations'
                    : AppTranslations.of(context)!.text("reservations.upcoming_reservations") + " ",
                onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
                  return new ReservationsPage();
                })),
              );
            }));
  }
}
