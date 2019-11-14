import 'package:app/module/data_provider.dart';
import 'package:app/module/general/gear_bloc.dart';
import 'package:app/pages/Gear/sections.dart';
import 'package:app/pages/Gear/widgets.dart';
import 'package:flutter/material.dart';

class GearScrollAlternative extends StatefulWidget {
  final List<Section> allSections;
  final int sectionIndex;

  const GearScrollAlternative({Key key, this.allSections, this.sectionIndex}) : super(key: key);
  @override
  _GearScrollAlternativeState createState() => _GearScrollAlternativeState();
}

class _GearScrollAlternativeState extends State<GearScrollAlternative> {

  PageController controller;

  @override
  void initState() {
    controller = new PageController(initialPage: widget.sectionIndex ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: new PageView(controller: controller,
          children: widget.allSections.map((Section section) {
            return Column(children: <Widget>[
              Container(child: new SectionCard(section: section)),
              Expanded(child: section.child)
            ]);
          }).toList(),
        ),
      ),
    );
  }
}

class GearScrollAlternativeCross extends StatefulWidget {
  @override
  _GearScrollAlternativeCrossState createState() =>
      _GearScrollAlternativeCrossState();
}

class _GearScrollAlternativeCrossState
    extends State<GearScrollAlternativeCross> {
  var innerScrollPhysics = AlwaysScrollableScrollPhysics();
  int curentView = 0;
  onViewChanged(int newView) {
    setState(() {
      curentView = newView;
    });
  }

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = DataProvider.getData(context);
    GearBloc gearBloc = dataProvider.gearBloc;
    List<Section> allSections = getAllSections(
        gearBloc, innerScrollPhysics, curentView, onViewChanged, context);
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ...allSections.asMap().map(
            (index,value) => new MapEntry(index, Expanded(
                          child: InkWell(
                onTap: () =>         Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => GearScrollAlternative(
allSections: allSections,sectionIndex: index,
                ),
            )),
                child:    Container(child: new SectionCard(section: value)),
              ),
            ),) 
          ).values,
          SizedBox(height: 55,)
        ],
      ),
    );
  }
}
