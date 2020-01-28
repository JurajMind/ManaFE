import 'package:app/pages/Gear/sections.dart';
import 'package:app/pages/Gear/widgets.dart';
import 'package:flutter/material.dart';

import 'gear_scroll_alternative.dart';

class GearScrollAlternativeCross extends StatefulWidget {
  @override
  _GearScrollAlternativeCrossState createState() => _GearScrollAlternativeCrossState();
}

class _GearScrollAlternativeCrossState extends State<GearScrollAlternativeCross> {
  var innerScrollPhysics = AlwaysScrollableScrollPhysics();
  int curentView = 0;
  onViewChanged(int newView) {
    setState(() {
      curentView = newView;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Section> allSections = getAllSections(curentView, onViewChanged, context);

    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useTabletLayout = shortestSide > 600;

    if (useTabletLayout) {
      return Scaffold(
        body: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 1200),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemCount: allSections.length,
                itemBuilder: (context, index) {
                  var section = allSections[index];
                  return Container(
                    margin: EdgeInsets.all(16),
                    constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GearScrollAlternative(
                          allSections: allSections,
                          sectionIndex: index,
                        ),
                      )),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(section.backgroundAsset),
                        )),
                        child: Center(
                            child: Text(
                          section.title,
                          style: Theme.of(context).textTheme.subtitle1,
                        )),
                      ),
                    ),
                  );
                }),
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ...allSections
              .asMap()
              .map((index, value) => new MapEntry(
                    index,
                    Expanded(
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GearScrollAlternative(
                            allSections: allSections,
                            sectionIndex: index,
                          ),
                        )),
                        child: Container(child: new SectionCard(section: value)),
                      ),
                    ),
                  ))
              .values,
          SizedBox(
            height: 55,
          )
        ],
      ),
    );
  }
}
