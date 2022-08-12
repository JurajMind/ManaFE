import 'package:app/Helpers/helpers.dart';
import 'package:flutter/material.dart';

class CalendarTile extends StatelessWidget {
  final VoidCallback? onDateSelected;
  final DateTime? date;
  final String? dayOfWeek;
  final bool isDayOfWeek;
  final bool isSelected;
  final TextStyle? dayOfWeekStyles;
  final TextStyle? dateStyles;
  final Widget? child;
  final int? eventCount;
  final doubleToNull;

  final bool isTodayhighlighted;

  CalendarTile(
      {this.onDateSelected,
      this.date,
      this.child,
      this.dateStyles,
      this.dayOfWeek,
      this.dayOfWeekStyles,
      this.isDayOfWeek: false,
      this.isSelected: false,
      this.eventCount,
      this.isTodayhighlighted: false,
      this.doubleToNull: false});

  BoxDecoration getDecorator(BuildContext context) {
    if (isSelected) {
      return new BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      );
    }

    if (isTodayhighlighted && compareDate(date!, DateTime.now()) == 0) {
      var color = Theme.of(context).primaryColor.withAlpha(100);
      return new BoxDecoration(shape: BoxShape.circle, color: color);
    }

    return new BoxDecoration();
  }

  Widget renderDateOrDayOfWeek(BuildContext context) {
    if (isDayOfWeek) {
      return new InkWell(
        child: new Container(
          alignment: Alignment.center,
          child: new Text(
            dayOfWeek!,
            style: dayOfWeekStyles,
          ),
        ),
      );
    } else {
      var container = new Container(
        decoration: getDecorator(context),
        alignment: Alignment.center,
        child: new Text(
          date.toString(),
          style: isSelected
              ? new TextStyle(color: Colors.white)
              : Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.center,
        ),
      );
      return new InkWell(
        onTap: onDateSelected,
        child: Stack(
          children: <Widget>[
            container,
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

  Widget buildEventCount(int? eventCount) {
    if (eventCount == null || eventCount == 0) return Container();

    return Container(
      decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
      child: Center(child: Text(eventCount.toString())),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return child!;
    }
    return new Container(
      decoration: new BoxDecoration(),
      child: renderDateOrDayOfWeek(context),
    );
  }
}
