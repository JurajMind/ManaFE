import 'package:app/pages/Gear/pipe_accesory.dart';
import 'package:app/pages/Gear/sections.dart';
import 'package:flutter/material.dart';

import 'devices.dart';

class GearScrollAlternative extends StatefulWidget {
  final List<Section> allSections;
  final int sectionIndex;

  const GearScrollAlternative({Key key, this.allSections, this.sectionIndex})
      : super(key: key);
  @override
  _GearScrollAlternativeState createState() => _GearScrollAlternativeState();
}

class _GearScrollAlternativeState extends State<GearScrollAlternative> {
  PageController controller;
  final _currentPageNotifier = ValueNotifier<int>(0);
  int pageIndex;
  List<Section> allSections;
  int currentView = 0;

  @override
  void didUpdateWidget(GearScrollAlternative oldWidget) {
    setState(() {
      allSections = widget.allSections;
    });

    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    allSections = widget.allSections;
    controller = new PageController(initialPage: widget.sectionIndex ?? 0);
    pageIndex = widget.sectionIndex ?? 0;
    _currentPageNotifier.value = pageIndex;

    super.initState();
  }

  onViewChanged(int newView) {
    setState(() {
      currentView = newView;
    });
  }

  @override
  Widget build(BuildContext context) {
    _currentPageNotifier.value = pageIndex;
    return Scaffold(
      body: new PageView(
        controller: controller,
        onPageChanged: (value) {
          _currentPageNotifier.value = value;
          setState(() {
            pageIndex = value;
          });
        },
        children: allSections.map((Section section) {
          return section.type == "Device"
              ? Devices(
                  section,
                  controller: controller,
                )
              : PipeAccesoryList(
                  section: section,
                  currentView: currentView,
                  onViewChanged: onViewChanged,
                  pageController: controller,
                  position: allSections.indexOf(section),
                );
        }).toList(),
      ),
    );
  }
}
