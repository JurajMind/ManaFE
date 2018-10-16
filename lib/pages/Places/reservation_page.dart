import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class ReservationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ReservationPageState();
  }
}

class _ReservationPageState extends State<ReservationPage> {
  final _textController = TextEditingController();

  DateTime _currentDate = DateTime(2018, 8, 1);
  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  PageController pageController = new PageController(initialPage: 0);
  void _showDatePicker() async {
    final DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: new DateTime(2015, 8),
        lastDate: new DateTime(2101));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: Colors.white),
      child: Theme(
        isMaterialAppTheme: true,
        data: ThemeData.light(),
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new AppBar(
              title: new Text('Book place'),
              backgroundColor: Colors.black,
              actions: <Widget>[
                IconButton(
icon:  Icon(Icons.chevron_right),
onPressed:() {
  pageController.jumpToPage(1);
},
                )
               
              ],
            ),
            Flexible(
              child: PageView(
                scrollDirection: Axis.vertical,
                controller: pageController,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CalendarCarousel(
                        onDayPressed: (DateTime date) {
                          this.setState(() => _currentDate = date);
                        },
                        weekendTextStyle: TextStyle(
                          color: Colors.red,
                        ),
                     
//          weekDays: null, /// for pass null when you do not want to render weekDays
//          headerText: Container( /// Example for rendering custom header
//            child: Text('Custom Header'),
//          ),
                        markedDates: _markedDate,
                        height: 420.0,
                        selectedDateTime: _currentDate,
                        daysHaveCircularBorder: true,

                        /// null for not rendering any border, true for circular border, false for rectangular border
                      ),
                      Row(
                        children: <Widget>[],
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.red),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
