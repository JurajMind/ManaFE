import 'package:app/models/Stand/animation.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:flutter/material.dart';

class AnimationStatePicker extends StatefulWidget {
  final SmokeSessionBloc smokeSessionBloc;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  AnimationStatePicker(
      {this.smokeSessionBloc, this.selectedIndex, this.onChanged});

  @override
  AnimationStatePickerState createState() {
    return new AnimationStatePickerState();
  }
}

class AnimationStatePickerState extends State<AnimationStatePicker> {
  int _focusIndex;
  bool _init = false;

  FixedExtentScrollController scrollController;

  @override
  void initState() {
    super.initState();
    _focusIndex = widget.selectedIndex;
    scrollController = new FixedExtentScrollController(
      initialItem: widget.selectedIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.75 + size.width,
      child: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SizedBox(
              height: size.height * 0.75,
              child: Container(
                child: NotificationListener(
                    onNotification: (ScrollNotification notification) {
                      if (notification.depth == 0 &&
                          notification is ScrollUpdateNotification) {
                        final FixedScrollMetrics metrics = notification.metrics;
                      }
                      return false;
                    },
                    child: buildAnimationList()),
              ))
        ],
      ),
    );
  }

  StreamBuilder<List<StandAnimation>> buildAnimationList() {
    return StreamBuilder<List<StandAnimation>>(
        stream: widget.smokeSessionBloc.animations,
        initialData: List<StandAnimation>(),
        builder: (context, snapshot) => new ListWheelScrollView(
              itemExtent: 50.0,
              controller: scrollController,
              clipToSize: true,
              diameterRatio: 10.0,
              perspective: 0.01,
              onSelectedItemChanged: (int index) {
                widget.onChanged(index);
                setState(() {
                  _focusIndex = index;
                });
              },
              children: List.generate(
                  snapshot.data.length,
                  (int index) => _createAnimation(index, snapshot.data[index],
                      context, widget.selectedIndex)),
            ));
  }

  _createAnimation(
      int index, StandAnimation data, BuildContext context, int selected) {
    if (!_init && data.id == selected) {
      _init = true;
      scrollController.jumpToItem(index);
      _focusIndex = index;
    }
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Center(
          child: Text(data.displayName,
              style: TextStyle(
                color: index == selected ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: data.id == _focusIndex ? 35.0 : 25.0,
              )),
        ),
      ),
    );
  }
}
