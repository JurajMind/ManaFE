import 'package:app/models/Stand/preset.dart';
import 'package:app/module/smokeSession/preset_bloc.dart';
import 'package:flutter/material.dart';

class PresetPicker extends StatefulWidget {
  final DevicePresetBloc presetBloc;
  final int selectedIndex;

  final ValueChanged<int> onChanged;
  PresetPicker({this.presetBloc, this.selectedIndex, this.onChanged});

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

  StreamBuilder<List<DevicePreset>> buildAnimationList() {
    return StreamBuilder<List<DevicePreset>>(
        stream: widget.presetBloc.devicePresets,
        initialData: List<DevicePreset>(),
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
                children: createAnimationList(snapshot.data),
              ));
  }

  List<Widget> createAnimationList(List<DevicePreset> presets) {
    var children = List.generate(
        presets.length,
        (int index) => _createPreset(
            index, presets[index], context, widget.selectedIndex));
    children.add(
        _createPreset(-1, new DevicePreset(-1, 'No preset', 0), context, 0));

    return children;
  }

  StreamBuilder<List<DevicePreset>> buildBottomBar() {
    return StreamBuilder<List<DevicePreset>>(
        stream: widget.presetBloc.devicePresets,
        initialData: null,
        builder: (context, snapshot) {
          return new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Presets',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
              ),
            ],
          );
        });
  }

  Widget _createPreset(
      int index, DevicePreset data, BuildContext context, int selected) {
    if (!_init && data.id == selected) {
      _init = true;
      scrollController.jumpToItem(index);
      _focusIndex = index;
    }
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Center(
          child: Text(data.name,
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
