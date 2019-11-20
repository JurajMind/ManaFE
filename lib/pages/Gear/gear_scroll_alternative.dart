import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/general/gear_bloc.dart';
import 'package:app/pages/Gear/sections.dart';
import 'package:app/pages/Gear/widgets.dart';
import 'package:app/support/m_platform.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    controller = new PageController(initialPage: widget.sectionIndex ?? 0);
    pageIndex = widget.sectionIndex ?? 0;
    _currentPageNotifier.value = pageIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _currentPageNotifier.value = pageIndex;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            new PageView(
              controller: controller,
              onPageChanged: (value) {
                _currentPageNotifier.value = value;
                setState(() {
                  pageIndex = value;
                });
              },
              children: widget.allSections.map((Section section) {
                return Column(children: <Widget>[
                  Container(child: new SectionCard(section: section)),
                  Expanded(
                      child: Container(
                          constraints: BoxConstraints(maxWidth: 1200),
                          child: section.child))
                ]);
              }).toList(),
            ),
            Positioned(
                top: 50,
                left: 0,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ArrowPageIndicator(
                    width: MediaQuery.of(context).size.width - 100,
                    pageController: controller,
                    itemCount: widget.allSections.length,
                    index: pageIndex)),
            pageIndex != 0
                ? Container()
                : Positioned(
                    top: 50,
                    left: 0,
                    width: 50,
                    height: 50,
                    child: BackButton(
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class ArrowPageIndicator extends StatelessWidget {
  final double width;
  final PageController pageController;
  final int itemCount;
  final int index;
  const ArrowPageIndicator(
      {Key key, this.width, this.pageController, this.itemCount, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          index == 0
              ? Container()
              : IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 50,
                  ),
                  onPressed: () {
                    this.pageController.animateToPage(index - 1,
                        duration: new Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                ),
          index == itemCount - 1
              ? Container()
              : IconButton(
                  icon: Icon(
                    Icons.chevron_right,
                    size: 50,
                  ),
                  onPressed: () {
                    this.pageController.animateToPage(index + 1,
                        duration: new Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                )
        ],
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

    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useTabletLayout = shortestSide > 600;

    if (useTabletLayout) {
      return Scaffold(
        body: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 1200),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
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
                          style: Theme.of(context).textTheme.title,
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
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GearScrollAlternative(
                            allSections: allSections,
                            sectionIndex: index,
                          ),
                        )),
                        child:
                            Container(child: new SectionCard(section: value)),
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
