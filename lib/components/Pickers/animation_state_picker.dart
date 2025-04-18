import 'package:app/models/SmokeSession/smoke_session.dart';

import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:flutter/services.dart';

import 'bottom_controll_bar.dart';

class AnimationStatePicker extends StatefulWidget {
  final SmokeSessionBloc? smokeSessionBloc;
  final int? selectedIndex;
  final String? label;
  final SmokeState? state;
  final ValueChanged<int>? onChanged;
  final bool? haveRightChevron;
  final bool? haveLeftChevron;
  AnimationStatePicker(
      {this.smokeSessionBloc,
      this.selectedIndex,
      this.onChanged,
      this.label,
      this.state,
      this.haveRightChevron,
      this.haveLeftChevron});

  @override
  AnimationStatePickerState createState() {
    return new AnimationStatePickerState();
  }
}

class AnimationStatePickerState extends State<AnimationStatePicker> {
  int? _focusIndex;
  bool _init = false;

  FixedExtentScrollController? scrollController;

  @override
  void initState() {
    super.initState();
    _focusIndex = widget.selectedIndex;
    scrollController = new FixedExtentScrollController(
      initialItem: widget.selectedIndex ?? 0,
    );
  }

  @override
  void didChangeDependencies() {
    scrollController!.jumpToItem(widget.selectedIndex!);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(AnimationStatePicker oldWidget) {
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      scrollController!.animateToItem(widget.selectedIndex!,
          curve: Curves.easeIn, duration: const Duration(milliseconds: 300));
    }
    super.didUpdateWidget(oldWidget);
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
                  Expanded(
                      flex: 1,
                      child: BottomControllBar(
                        haveLeftChevron: widget.haveLeftChevron,
                        label: widget.label,
                        haveRightChevron: widget.haveRightChevron,
                        state: widget.state,
                      ))
                ],
              ))
        ],
      ),
    );
  }

  StreamBuilder<List<SmartHookahHelpersAnimation>?> buildAnimationList() {
    return StreamBuilder<List<SmartHookahHelpersAnimation>?>(
        stream: widget.smokeSessionBloc!.animations,
        initialData: <SmartHookahHelpersAnimation>[],
        builder: (context, snapshot) {
          return snapshot.data?.length == 0
              ? Container()
              : ClickableListWheelScrollView(
                  scrollController: scrollController!,
                  itemHeight: 70,
                  itemCount: snapshot.data!.length,
                  onItemTapCallback: (index) {
                    print("onItemTapCallback index: $index");
                  },
                  scrollOnTap: true,
                  child: ListWheelScrollView.useDelegate(
                    controller: scrollController,
                    itemExtent: 70,
                    physics: FixedExtentScrollPhysics(),
                    overAndUnderCenterOpacity: 0.7,
                    perspective: 0.004,
                    onSelectedItemChanged: (index) {
                      if (index == 0) {
                        print('fake');
                      }
                      widget.onChanged!(index);
                      setState(() {
                        _focusIndex = index;
                        //Vibration.vibrate(duration: 2);
                        HapticFeedback.selectionClick();
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) =>
                          _createAnimation(index, snapshot.data![index], context, widget.selectedIndex),
                      childCount: snapshot.data!.length,
                    ),
                  ));

          return snapshot.data?.length == 0
              ? Container()
              : ListWheelScrollView(
                  itemExtent: 70.0,
                  controller: scrollController,
                  // clipToSize: true,
                  diameterRatio: 10.0,
                  perspective: 0.005,
                  onSelectedItemChanged: (int index) {
                    if (index == 0) {
                      print('fake');
                    }
                    widget.onChanged!(index);
                    setState(() {
                      _focusIndex = index;
                      //Vibration.vibrate(duration: 2);
                      HapticFeedback.selectionClick();
                    });
                  },
                  children: List.generate(snapshot.data!.length,
                      (int index) => _createAnimation(index, snapshot.data![index], context, widget.selectedIndex)),
                );
        });
  }

  _createAnimation(int index, SmartHookahHelpersAnimation data, BuildContext context, int? selected) {
    if (!_init && data.id == selected) {
      _init = true;
      scrollController!.jumpToItem(index);
      _focusIndex = index;
    }
    return GestureDetector(
      onTap: () {
        scrollController!.animateToItem(index, duration: Duration(microseconds: 500), curve: Curves.easeIn);
        _focusIndex = index;
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Center(
            child: Text(data.displayName!,
                style: TextStyle(
                  color: index == selected ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: data.id == _focusIndex ? 35.0 : 25.0,
                )),
          ),
        ),
      ),
    );
  }
}
