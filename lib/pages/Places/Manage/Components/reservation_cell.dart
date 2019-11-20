import 'package:flutter/material.dart';

import '../manage_reservation.page.dart';

class ReservationCell extends StatefulWidget {
  final ColumnData data;
  final double cellWidth;

  final DragTargetAccept<ColumnData> onAccept;

  ReservationCell({Key key, this.data, this.onAccept, this.cellWidth})
      : super(key: key);

  @override
  _ReservationCellState createState() => _ReservationCellState();
}

class _ReservationCellState extends State<ReservationCell> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.data.size * widget.cellWidth,
      child: widget.data.reservation == null
          ? DragTarget<ColumnData>(
              builder: (BuildContext context, List<ColumnData> incoming,
                  List rejected) {
                return EmptyCell(
                  hover: hover,
                  data: widget.data,
                );
              },
              onWillAccept: (data) {
                setState(() {
                  this.hover = true;
                });
                return data.reservation != null;
              },
              onAccept: (data) {},
              onLeave: (data) {
                setState(() {
                  this.hover = true;
                });
              },
            )
          : Draggable<ColumnData>(
              childWhenDragging: Container(
                height: 100,
                child: Row(
                  children: <Widget>[
                    ...List.generate(widget.data.size, (index) {
                      var data = new ColumnData();
                      data.size = widget.data.size;
                      return (ReservationCell(
                        data: data,
                        cellWidth: widget.cellWidth,
                      ));
                    })
                  ],
                ),
              ),
              feedback: Container(
                  height: 100,
                  color: Colors.red,
                  child: Text(widget.data.reservation.name)),
              child: Container(
                height: 100,
                color: Colors.red,
                child: Column(
                  children: <Widget>[
                    Text(widget.data.reservation.name),
                    Text(widget.data.size.toString())
                  ],
                ),
              )),
    );
  }
}

class EmptyCell extends StatelessWidget {
  const EmptyCell({
    Key key,
    this.hover = false,
    @required this.data,
  }) : super(key: key);

  final bool hover;
  final ColumnData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: hover ? Colors.blue : Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      width: 100,
      height: 100,
      child: Text(
        data.size.toString(),
        style: Theme.of(context).textTheme.display4.apply(color: Colors.red),
      ),
    );
  }
}
