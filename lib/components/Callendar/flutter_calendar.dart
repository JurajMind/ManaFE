import 'dart:async';

import 'package:app/Helpers/date_utils.dart' as dayHelper;
import 'package:app/Helpers/day_helper.dart';
import 'package:app/Helpers/helpers.dart';
import 'package:app/components/Callendar/calendar_tile.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:dartz/dartz.dart' hide State;

import 'package:flutter/material.dart';

typedef DayBuilder(BuildContext context, DateTime day);

class Calendar extends StatefulWidget {
  final ValueChanged<DateTime?>? onDateSelected;
  final ValueChanged<Tuple2<DateTime, DateTime>>? onSelectedRangeChange;
  final bool isExpandable;
  final DayBuilder? dayBuilder;
  final bool showChevronsToChangeRange;
  final bool showTodayAction;
  final bool highlightToday;
  final bool showCalendarPickerIcon;
  final bool doubleClick;
  final TextStyle? dateStyles;
  final DateTime? initialCalendarDateOverride;
  final Map<DateTime, List<String>>? events;

  Calendar({
    this.onDateSelected,
    this.onSelectedRangeChange,
    this.isExpandable: false,
    this.dayBuilder,
    this.showTodayAction: true,
    this.showChevronsToChangeRange: true,
    this.showCalendarPickerIcon: true,
    this.initialCalendarDateOverride,
    this.dateStyles,
    this.events,
    this.highlightToday: false,
    this.doubleClick: false,
  });

  @override
  _CalendarState createState() => new _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final calendarUtils = new dayHelper.DateUtils();
  late List<DateTime> selectedMonthsDays;
  late Iterable<DateTime> selectedWeeksDays;
  DateTime? _selectedDate = new DateTime.now();
  String? currentMonth;
  bool isExpanded = false;
  late String displayMonth;
  DateTime? get selectedDate => _selectedDate;
  bool doubleClick = false;
  void initState() {
    super.initState();

    if (widget.initialCalendarDateOverride != null)
      _selectedDate = widget.initialCalendarDateOverride;
    selectedMonthsDays = dayHelper.DateUtils.daysInMonth(_selectedDate!);
    var firstDayOfCurrentWeek =
        dayHelper.DateUtils.firstDayOfWeek(_selectedDate!);
    var lastDayOfCurrentWeek = dayHelper.DateUtils.lastDayOfWeek(_selectedDate!);
    selectedWeeksDays = dayHelper.DateUtils.daysInRange(
            firstDayOfCurrentWeek, lastDayOfCurrentWeek)
        .toList()
        .sublist(0, 7);
    displayMonth = dayHelper.DateUtils.formatMonth(_selectedDate!);
  }

  Widget get nameAndIconRow {
    var leftInnerIcon;
    var rightInnerIcon;
    var leftOuterIcon;
    var rightOuterIcon;

    if (widget.showCalendarPickerIcon) {
      rightInnerIcon = new IconButton(
        onPressed: () => selectDateFromPicker(),
        icon: new Icon(Icons.calendar_today),
      );
    } else {
      rightInnerIcon = new Container();
    }

    if (widget.showChevronsToChangeRange) {
      leftOuterIcon = new IconButton(
        onPressed: isExpanded ? previousMonth : previousWeek,
        icon: new Icon(Icons.chevron_left),
      );
      rightOuterIcon = new IconButton(
        onPressed: isExpanded ? nextMonth : nextWeek,
        icon: new Icon(Icons.chevron_right),
      );
    } else {
      leftOuterIcon = new Container();
      rightOuterIcon = new Container();
    }

    if (widget.showTodayAction) {
      leftInnerIcon = new InkWell(
        child: new Text(AppTranslations.of(context)!.text("reservations.today")),
        onTap: resetToToday,
      );
    } else {
      leftInnerIcon = new Container();
    }

    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leftOuterIcon ?? new Container(),
        leftInnerIcon ?? new Container(),
        new Text(
          displayMonth,
          style: new TextStyle(
            fontSize: 20.0,
          ),
        ),
        rightInnerIcon ?? new Container(),
        rightOuterIcon ?? new Container(),
      ],
    );
  }

  Widget get calendarGridView {
    return new Container(
      child: new GestureDetector(
        onHorizontalDragStart: (gestureDetails) => beginSwipe(gestureDetails),
        onHorizontalDragUpdate: (gestureDetails) =>
            getDirection(gestureDetails),
        onHorizontalDragEnd: (gestureDetails) => endSwipe(gestureDetails),
        child: new GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 7,
          padding: new EdgeInsets.only(bottom: 0.0),
          children: calendarBuilder(),
        ),
      ),
    );
  }

  List<Widget> calendarBuilder() {
    List<Widget> dayWidgets = [];
    List<DateTime> calendarDays =
        isExpanded ? selectedMonthsDays : selectedWeeksDays as List<DateTime>;

    var weekdays = List<int>.generate(7, (i) => i + 1)
        .map((f) => getShortDayName(f, context));

    weekdays.forEach(
      (day) {
        dayWidgets.add(
          new CalendarTile(
            isDayOfWeek: true,
            dayOfWeek: day,
            dateStyles: widget.dateStyles,
          ),
        );
      },
    );

    bool monthStarted = false;
    bool monthEnded = false;

    calendarDays.forEach(
      (day) {
        if (monthStarted && day.day == 01) {
          monthEnded = true;
        }

        if (dayHelper.DateUtils.isFirstDayOfMonth(day)) {
          monthStarted = true;
        }

        if (this.widget.dayBuilder != null) {
          dayWidgets.add(
            new CalendarTile(
              child: this.widget.dayBuilder!(context, day),
              eventCount: widget.events![day]?.length,
            ),
          );
        } else {
          dayWidgets.add(
            new CalendarTile(
              onDateSelected: () => handleSelectedDateAndUserCallback(day),
              date: day,
              dateStyles: configureDateStyle(monthStarted, monthEnded),
              isSelected: dayHelper.DateUtils.isSameDay(selectedDate!, day) &&
                  !this.doubleClick,
              isTodayhighlighted: widget.highlightToday,
              eventCount: widget.events == null
                  ? 0
                  : widget.events![new DateTime(day.year, day.month, day.day)]
                      ?.length,
            ),
          );
        }
      },
    );
    return dayWidgets;
  }

  TextStyle configureDateStyle(monthStarted, monthEnded) {
    TextStyle dateStyles;
    if (isExpanded) {
      dateStyles = monthStarted && !monthEnded
          ? new TextStyle(color: Colors.black)
          : new TextStyle(color: Colors.black38);
    } else {
      dateStyles = new TextStyle(color: Colors.black);
    }
    return dateStyles;
  }

  Widget get expansionButtonRow {
    if (widget.isExpandable) {
      return new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new IconButton(
            iconSize: 20.0,
            padding: new EdgeInsets.all(0.0),
            onPressed: toggleExpanded,
            icon: isExpanded
                ? new Icon(Icons.arrow_drop_up)
                : new Icon(Icons.arrow_drop_down),
          ),
        ],
      );
    } else {
      return new Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          nameAndIconRow,
          new ExpansionCrossFade(
            collapsed: calendarGridView,
            expanded: calendarGridView,
            isExpanded: isExpanded,
          ),
          expansionButtonRow
        ],
      ),
    );
  }

  void resetToToday() {
    _selectedDate = new DateTime.now();
    var firstDayOfCurrentWeek =
        dayHelper.DateUtils.firstDayOfWeek(_selectedDate!);
    var lastDayOfCurrentWeek = dayHelper.DateUtils.lastDayOfWeek(_selectedDate!);
    setState(() {
      selectedWeeksDays = dayHelper.DateUtils.daysInRange(
              firstDayOfCurrentWeek, lastDayOfCurrentWeek)
          .toList();
      displayMonth = dayHelper.DateUtils.formatMonth(_selectedDate!);
    });

    _launchDateSelectionCallback(_selectedDate);
  }

  void nextMonth() {
    setState(() {
      _selectedDate = dayHelper.DateUtils.nextMonth(_selectedDate!);
      var firstDateOfNewMonth =
          dayHelper.DateUtils.firstDayOfMonth(_selectedDate!);
      var lastDateOfNewMonth =
          dayHelper.DateUtils.lastDayOfMonth(_selectedDate!);
      updateSelectedRange(firstDateOfNewMonth, lastDateOfNewMonth);
      selectedMonthsDays = dayHelper.DateUtils.daysInMonth(_selectedDate!);
      displayMonth = dayHelper.DateUtils.formatMonth(_selectedDate!);
      widget.onDateSelected!(_selectedDate);
      var firstDayOfCurrentWeek =
          dayHelper.DateUtils.firstDayOfWeek(_selectedDate!);
      var lastDayOfCurrentWeek =
          dayHelper.DateUtils.lastDayOfWeek(_selectedDate!);
      selectedWeeksDays = dayHelper.DateUtils.daysInRange(
              firstDayOfCurrentWeek, lastDayOfCurrentWeek)
          .toList()
          .sublist(0, 7);
    });
  }

  void previousMonth() {
    setState(() {
      _selectedDate = dayHelper.DateUtils.previousMonth(_selectedDate!);
      var firstDateOfNewMonth =
          dayHelper.DateUtils.firstDayOfMonth(_selectedDate!);
      var lastDateOfNewMonth =
          dayHelper.DateUtils.lastDayOfMonth(_selectedDate!);
      updateSelectedRange(firstDateOfNewMonth, lastDateOfNewMonth);
      selectedMonthsDays = dayHelper.DateUtils.daysInMonth(_selectedDate!);
      displayMonth = dayHelper.DateUtils.formatMonth(_selectedDate!);
      widget.onDateSelected!(_selectedDate);
      var firstDayOfCurrentWeek =
          dayHelper.DateUtils.firstDayOfWeek(_selectedDate!);
      var lastDayOfCurrentWeek =
          dayHelper.DateUtils.lastDayOfWeek(_selectedDate!);
      selectedWeeksDays = dayHelper.DateUtils.daysInRange(
              firstDayOfCurrentWeek, lastDayOfCurrentWeek)
          .toList()
          .sublist(0, 7);
    });
  }

  void nextWeek() {
    setState(() {
      _selectedDate = dayHelper.DateUtils.nextWeek(_selectedDate!);
      var firstDayOfCurrentWeek =
          dayHelper.DateUtils.firstDayOfWeek(_selectedDate!);
      var lastDayOfCurrentWeek =
          dayHelper.DateUtils.lastDayOfWeek(_selectedDate!);
      selectedWeeksDays = dayHelper.DateUtils.daysInRange(
              firstDayOfCurrentWeek, lastDayOfCurrentWeek)
          .toList()
          .sublist(0, 7);
      updateSelectedRange(firstDayOfCurrentWeek, lastDayOfCurrentWeek);
      selectedMonthsDays = dayHelper.DateUtils.daysInMonth(_selectedDate!);

      displayMonth = dayHelper.DateUtils.formatMonth(_selectedDate!);
      widget.onDateSelected!(_selectedDate);
    });
  }

  void previousWeek() {
    setState(() {
      _selectedDate = dayHelper.DateUtils.previousWeek(_selectedDate!);
      var firstDayOfCurrentWeek =
          dayHelper.DateUtils.firstDayOfWeek(_selectedDate!);
      var lastDayOfCurrentWeek =
          dayHelper.DateUtils.lastDayOfWeek(_selectedDate!);
      updateSelectedRange(firstDayOfCurrentWeek, lastDayOfCurrentWeek);
      selectedMonthsDays = dayHelper.DateUtils.daysInMonth(_selectedDate!);
      selectedWeeksDays = dayHelper.DateUtils.daysInRange(
              firstDayOfCurrentWeek, lastDayOfCurrentWeek)
          .toList()
          .sublist(0, 7);
      displayMonth = dayHelper.DateUtils.formatMonth(_selectedDate!);
      widget.onDateSelected!(_selectedDate);
    });
  }

  void updateSelectedRange(DateTime start, DateTime end) {
    var selectedRange = new Tuple2<DateTime, DateTime>(start, end);
    if (widget.onSelectedRangeChange != null) {
      widget.onSelectedRangeChange!(selectedRange);
    }
  }

  Future<Null> selectDateFromPicker() async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? new DateTime.now(),
      firstDate: new DateTime(1960),
      lastDate: new DateTime(2050),
    );

    if (selected != null) {
      var firstDayOfCurrentWeek = dayHelper.DateUtils.firstDayOfWeek(selected);
      var lastDayOfCurrentWeek = dayHelper.DateUtils.lastDayOfWeek(selected);

      setState(() {
        _selectedDate = selected;
        selectedWeeksDays = dayHelper.DateUtils.daysInRange(
                firstDayOfCurrentWeek, lastDayOfCurrentWeek)
            .toList();
        selectedMonthsDays = dayHelper.DateUtils.daysInMonth(selected);
        displayMonth = dayHelper.DateUtils.formatMonth(selected);
      });
      // updating selected date range based on selected week
      updateSelectedRange(firstDayOfCurrentWeek, lastDayOfCurrentWeek);
      _launchDateSelectionCallback(selected);
    }
  }

  late var gestureStart;
  var gestureDirection;

  void beginSwipe(DragStartDetails gestureDetails) {
    gestureStart = gestureDetails.globalPosition.dx;
  }

  void getDirection(DragUpdateDetails gestureDetails) {
    if (gestureDetails.globalPosition.dx < gestureStart) {
      gestureDirection = 'rightToLeft';
    } else {
      gestureDirection = 'leftToRight';
    }
  }

  void endSwipe(DragEndDetails gestureDetails) {
    if (gestureDirection == 'rightToLeft') {
      if (isExpanded) {
        nextMonth();
      } else {
        nextWeek();
      }
    } else {
      if (isExpanded) {
        previousMonth();
      } else {
        previousWeek();
      }
    }
  }

  void toggleExpanded() {
    if (widget.isExpandable) {
      setState(() => isExpanded = !isExpanded);
    }
  }

  void handleSelectedDateAndUserCallback(DateTime day) {
    var firstDayOfCurrentWeek = dayHelper.DateUtils.firstDayOfWeek(day);
    var lastDayOfCurrentWeek = dayHelper.DateUtils.lastDayOfWeek(day);
    var doubleClick = false;
    if (widget.doubleClick && !this.doubleClick) {
      if (compareDate(day, _selectedDate!) == 0) {
        doubleClick = true;
      }
    }
    setState(() {
      this.doubleClick = doubleClick;
      _selectedDate = day;
      selectedWeeksDays = dayHelper.DateUtils.daysInRange(
              firstDayOfCurrentWeek, lastDayOfCurrentWeek)
          .toList();
      selectedMonthsDays = dayHelper.DateUtils.daysInMonth(day);
    });

    _launchDateSelectionCallback(day);
  }

  void _launchDateSelectionCallback(DateTime? day) {
    if (widget.onDateSelected != null) {
      if (doubleClick) {
        widget.onDateSelected!(null);
      } else {
        widget.onDateSelected!(day);
      }
    }
  }
}

class ExpansionCrossFade extends StatelessWidget {
  final Widget? collapsed;
  final Widget? expanded;
  final bool? isExpanded;

  ExpansionCrossFade({this.collapsed, this.expanded, this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return new Flexible(
      flex: 1,
      child: new AnimatedCrossFade(
        firstChild: collapsed!,
        secondChild: expanded!,
        firstCurve: const Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
        secondCurve: const Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
        sizeCurve: Curves.decelerate,
        crossFadeState:
            isExpanded! ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 300),
      ),
    );
  }
}
