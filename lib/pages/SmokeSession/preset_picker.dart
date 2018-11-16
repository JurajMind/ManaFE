import 'package:app/models/SmokeSession/smoke_session.dart';
import 'package:app/models/Stand/animation.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:flutter/material.dart';

class PresetPicker extends StatefulWidget {
  final SmokeSessionBloc smokeSessionBloc;
  final int selectedIndex;

  final ValueChanged<int> onChanged;
  PresetPicker({this.smokeSessionBloc, this.selectedIndex, this.onChanged});

  @override
  PresetPickerState createState() {
    return new PresetPickerState();
  }
}

class PresetPickerState extends State<PresetPicker> {
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
      height: size.height * 0.75 + 50,
      child: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SizedBox(
              height: size.height * 0.75,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: buildAnimationList(),
                  ),
                  Expanded(flex: 1, child: buildBottomBar())
                ],
              ))
        ],
      ),
    );
  }

  StreamBuilder<List<StandAnimation>> buildAnimationList() {
    return StreamBuilder<List<StandAnimation>>(
        stream: widget.smokeSessionBloc.animations,
        initialData: List<StandAnimation>(),
        builder: (context, snapshot) => snapshot.data.length == 0
            ? Container()
            : ListWheelScrollView(
                itemExtent: 50.0,
                controller: scrollController,
                clipToSize: true,
                diameterRatio: 10.0,
                perspective: 0.01,
                onSelectedItemChanged: (int index) {
                  if (index == 0) {
                    print('fake');
                  }
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

  StreamBuilder<StandSettings> buildBottomBar() {
    return StreamBuilder<StandSettings>(
        stream: widget.smokeSessionBloc.standSettings,
        initialData: StandSettings.empty(),
        builder: (context, snapshot) {
          return new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Preset',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
              ),
            ],
          );
        });
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
