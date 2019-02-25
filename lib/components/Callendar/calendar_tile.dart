import 'package:flutter/material.dart';
import 'package:date_utils/date_utils.dart';

class CalendarTile extends StatelessWidget {
  final VoidCallback onDateSelected;
  final DateTime date;
  final String dayOfWeek;
  final bool isDayOfWeek;
  final bool isSelected;
  final TextStyle dayOfWeekStyles;
  final TextStyle dateStyles;
  final Widget child;
  final int eventCount;

  CalendarTile({
    this.onDateSelected,
    this.date,
    this.child,
    this.dateStyles,
    this.dayOfWeek,
    this.dayOfWeekStyles,
    this.isDayOfWeek: false,
    this.isSelected: false,
    this.eventCount,
  });

  Widget renderDateOrDayOfWeek(BuildContext context) {
    if (isDayOfWeek) {
      return new InkWell(
        child: new Container(
          alignment: Alignment.center,
          child: new Text(
            dayOfWeek,
            style: dayOfWeekStyles,
          ),
        ),
      );
    } else {
      return new InkWell(
        onTap: onDateSelected,
        child: Stack(
          children: <Widget>[
            new Container(
              decoration: isSelected
                  ? new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    )
                  : new BoxDecoration(),
              alignment: Alignment.center,
              child: new Text(
                Utils.formatDay(date).toString(),
                style: isSelected
                    ? new TextStyle(color: Colors.white)
                    : Theme.of(context).textTheme.body1,
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
                width: 20.0,
                height: 20.0,
                bottom: 5,
                right: 0,
                child: (buildEventCount(eventCount))),
          ],
        ),
      );
    }
  }

  Widget buildEventCount(int eventCount) {
    if (eventCount == null || eventCount == 0) 
    return Container();

    return Container(
      decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
      child: Center(child: Text(eventCount.toString())),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return child;
    }
    return new Container(
      decoration: new BoxDecoration(),
      child: renderDateOrDayOfWeek(context),
    );
  }
}
