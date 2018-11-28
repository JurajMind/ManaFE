import 'package:app/models/Stand/preset.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:flutter/material.dart';

class PresetPicker extends StatefulWidget {
  final SmokeSessionBloc presetBloc;
  final ValueChanged<DevicePreset> onChanged;
  PresetPicker({this.presetBloc, this.onChanged});

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

    _focusIndex = 0;
    scrollController = new FixedExtentScrollController();
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
                  widget.onChanged(index == 0 ? DevicePreset.empty() : snapshot.data[index - 1]);
                  setState(() {
                    _focusIndex = index;
                  });
                },
                children: createAnimationList(snapshot.data, widget.presetBloc),
              ));
  }

  List<Widget> createAnimationList(
    List<DevicePreset> presets,
    SmokeSessionBloc presetBloc,
  ) {
    var children = List.generate(
        presets.length,
        (int index) =>
            _createPreset(index, presets[index], context, presetBloc));
    children.insert(
        0, _createPreset(-1, DevicePreset(-1, ' ', -1), context, presetBloc));

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

  StreamBuilder<DevicePreset> _createPreset(int index, DevicePreset data, BuildContext context, SmokeSessionBloc presetBloc) {

    return StreamBuilder<DevicePreset>(
      initialData: DevicePreset.empty(),
      stream: presetBloc.selectedPreset,
      builder: (context,snapshop){
        var selected = snapshop.data.id == data.id;
       

            return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Center(
          child: Text(data.name,
              style: TextStyle(
                color: selected ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: index + 1 == _focusIndex ? 35.0 : 25.0,
              )),
        ),
      ),
    );
      },
    );

    

  }
}
