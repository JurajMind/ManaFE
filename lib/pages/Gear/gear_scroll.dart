// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Based on https://material.uplabs.com/posts/google-newsstand-navigation-pattern
// See also: https://material-motion.github.io/material-motion/documentation/

import 'dart:math' as math;

import 'package:app/module/data_provider.dart';
import 'package:app/module/general/gear_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'sections.dart';
import 'widgets.dart';

const Color _kAppBackgroundColor = Colors.black;
const Duration _kScrollDuration = Duration(milliseconds: 400);
const Curve _kScrollCurve = Curves.fastOutSlowIn;

// This app's contents start out at _kHeadingMaxHeight and they function like
// an appbar. Initially the appbar occupies most of the screen and its section
// headings are laid out in a column. By the time its height has been
// reduced to _kAppBarMidHeight, its layout is horizontal, only one section
// heading is visible, and the section's list of details is visible below the
// heading. The appbar's height can be reduced to no more than _kAppBarMinHeight.
const double _kAppBarMinHeight = 90.0;
const double _kAppBarMidHeight = 256.0;
const double _kAppBarMaxHeight = 610.0;
// The AppBar's max height depends on the screen, see _AnimationDemoHomeState._buildBody()

// Initially occupies the same space as the status bar and gets smaller as
// the primary scrollable scrolls upwards.
// TODO(hansmuller): it would be worth adding something like this to the framework.
class _RenderStatusBarPaddingSliver extends RenderSliver {
  _RenderStatusBarPaddingSliver({
    @required double maxHeight,
    @required double scrollFactor,
  })  : assert(maxHeight != null && maxHeight >= 0.0),
        assert(scrollFactor != null && scrollFactor >= 1.0),
        _maxHeight = maxHeight,
        _scrollFactor = scrollFactor;

  // The height of the status bar
  double get maxHeight => _maxHeight;
  double _maxHeight;
  set maxHeight(double value) {
    assert(maxHeight != null && maxHeight >= 0.0);
    if (_maxHeight == value) return;
    _maxHeight = value;
    markNeedsLayout();
  }

  // That rate at which this renderer's height shrinks when the scroll
  // offset changes.
  double get scrollFactor => _scrollFactor;
  double _scrollFactor;
  set scrollFactor(double value) {
    assert(scrollFactor != null && scrollFactor >= 1.0);
    if (_scrollFactor == value) return;
    _scrollFactor = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    final double height = (maxHeight - constraints.scrollOffset / scrollFactor)
        .clamp(0.0, maxHeight);
    geometry = new SliverGeometry(
      paintExtent: math.min(height, constraints.remainingPaintExtent),
      scrollExtent: maxHeight,
      maxPaintExtent: maxHeight,
    );
  }
}

class _StatusBarPaddingSliver extends SingleChildRenderObjectWidget {
  const _StatusBarPaddingSliver({
    Key key,
    @required this.maxHeight,
    this.scrollFactor = 5.0,
  })  : assert(maxHeight != null && maxHeight >= 0.0),
        assert(scrollFactor != null && scrollFactor >= 1.0),
        super(key: key);

  final double maxHeight;
  final double scrollFactor;

  @override
  _RenderStatusBarPaddingSliver createRenderObject(BuildContext context) {
    return new _RenderStatusBarPaddingSliver(
      maxHeight: maxHeight,
      scrollFactor: scrollFactor,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderStatusBarPaddingSliver renderObject) {
    renderObject
      ..maxHeight = maxHeight
      ..scrollFactor = scrollFactor;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(new DoubleProperty('maxHeight', maxHeight));
    description.add(new DoubleProperty('scrollFactor', scrollFactor));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }

  @override
  String toString() => '_SliverAppBarDelegate';
}

// Arrange the section titles, indicators, and cards. The cards are only included when
// the layout is transitioning between vertical and horizontal. Once the layout is
// horizontal the cards are laid out by a PageView.
//
// The layout of the section cards, titles, and indicators is defined by the
// two 0.0-1.0 "t" parameters, both of which are based on the layout's height:
// - tColumnToRow
//   0.0 when height is maxHeight and the layout is a column
//   1.0 when the height is midHeight and the layout is a row
// - tCollapsed
//   0.0 when height is midHeight and the layout is a row
//   1.0 when height is minHeight and the layout is a (still) row
//
// minHeight < midHeight < maxHeight
//
// The general approach here is to compute the column layout and row size
// and position of each element and then interpolate between them using
// tColumnToRow. Once tColumnToRow reaches 1.0, the layout changes are
// defined by tCollapsed. As tCollapsed increases the titles spread out
// until only one title is visible and the indicators cluster together
// until they're all visible.
class _AllSectionsLayout extends MultiChildLayoutDelegate {
  _AllSectionsLayout({
    this.translation,
    this.tColumnToRow,
    this.tCollapsed,
    this.cardCount,
    this.selectedIndex,
  });

  final Alignment translation;
  final double tColumnToRow;
  final double tCollapsed;
  final int cardCount;
  final double selectedIndex;

  Rect _interpolateRect(Rect begin, Rect end) {
    return Rect.lerp(begin, end, tColumnToRow);
  }

  Offset _interpolatePoint(Offset begin, Offset end) {
    return Offset.lerp(begin, end, tColumnToRow);
  }

  @override
  void performLayout(Size size) {
    final double columnCardX = size.width / 5.0;
    final double columnCardWidth = size.width - columnCardX;
    final double columnCardHeight = size.height / cardCount;
    final double rowCardWidth = size.width;
    final Offset offset = translation.alongSize(size);
    double columnCardY = 0.0;
    double rowCardX = -(selectedIndex * rowCardWidth);

    // When tCollapsed > 0 the titles spread apart
    final double columnTitleX = size.width / 10.0;
    final double rowTitleWidth = size.width * ((1 + tCollapsed) / 2.25);
    double rowTitleX =
        (size.width - rowTitleWidth) / 2.0 - selectedIndex * rowTitleWidth;

    // When tCollapsed > 0, the indicators move closer together
    //final double rowIndicatorWidth = 48.0 + (1.0 - tCollapsed) * (rowTitleWidth - 48.0);
    const double paddedSectionIndicatorWidth = kSectionIndicatorWidth + 8.0;
    final double rowIndicatorWidth = paddedSectionIndicatorWidth +
        (1.0 - tCollapsed) * (rowTitleWidth - paddedSectionIndicatorWidth);
    double rowIndicatorX = (size.width - rowIndicatorWidth) / 2.0 -
        selectedIndex * rowIndicatorWidth;

    // Compute the size and origin of each card, title, and indicator for the maxHeight
    // "column" layout, and the midHeight "row" layout. The actual layout is just the
    // interpolated value between the column and row layouts for t.
    for (int index = 0; index < cardCount; index++) {
      // Layout the card for index.
      final Rect columnCardRect = new Rect.fromLTWH(
          columnCardX, columnCardY, columnCardWidth, columnCardHeight);
      final Rect rowCardRect =
          new Rect.fromLTWH(rowCardX, 0.0, rowCardWidth, size.height);
      final Rect cardRect =
          _interpolateRect(columnCardRect, rowCardRect).shift(offset);
      final String cardId = 'card$index';
      if (hasChild(cardId)) {
        layoutChild(cardId, new BoxConstraints.tight(cardRect.size));
        positionChild(cardId, cardRect.topLeft);
      }

      // Layout the title for index.
      final Size titleSize =
          layoutChild('title$index', new BoxConstraints.loose(cardRect.size));
      final double columnTitleY =
          columnCardRect.centerLeft.dy - titleSize.height / 2.0;
      final double rowTitleY =
          rowCardRect.centerLeft.dy - titleSize.height / 2.0;
      final double centeredRowTitleX =
          rowTitleX + (rowTitleWidth - titleSize.width) / 2.0;
      final Offset columnTitleOrigin = new Offset(columnTitleX, columnTitleY);
      final Offset rowTitleOrigin = new Offset(centeredRowTitleX, rowTitleY);
      final Offset titleOrigin =
          _interpolatePoint(columnTitleOrigin, rowTitleOrigin);
      positionChild('title$index', titleOrigin + offset);

      // Layout the selection indicator for index.
      final Size indicatorSize = layoutChild(
          'indicator$index', new BoxConstraints.loose(cardRect.size));
      final double columnIndicatorX =
          cardRect.centerRight.dx - indicatorSize.width - 16.0;
      final double columnIndicatorY =
          cardRect.bottomRight.dy - indicatorSize.height - 16.0;
      final Offset columnIndicatorOrigin =
          new Offset(columnIndicatorX, columnIndicatorY);
      final Rect titleRect =
          new Rect.fromPoints(titleOrigin, titleSize.bottomRight(titleOrigin));
      final double centeredRowIndicatorX =
          rowIndicatorX + (rowIndicatorWidth - indicatorSize.width) / 2.0;
      final double rowIndicatorY = titleRect.bottomCenter.dy + 16.0;
      final Offset rowIndicatorOrigin =
          new Offset(centeredRowIndicatorX, rowIndicatorY);
      final Offset indicatorOrigin =
          _interpolatePoint(columnIndicatorOrigin, rowIndicatorOrigin);
      positionChild('indicator$index', indicatorOrigin + offset);

      columnCardY += columnCardHeight;
      rowCardX += rowCardWidth;
      rowTitleX += rowTitleWidth;
      rowIndicatorX += rowIndicatorWidth;
    }
  }

  @override
  bool shouldRelayout(_AllSectionsLayout oldDelegate) {
    return tColumnToRow != oldDelegate.tColumnToRow ||
        cardCount != oldDelegate.cardCount ||
        selectedIndex != oldDelegate.selectedIndex;
  }
}

class _AllSectionsView extends AnimatedWidget {
  _AllSectionsView({
    Key key,
    this.sectionIndex,
    @required this.sections,
    @required this.selectedIndex,
    this.minHeight,
    this.midHeight,
    this.maxHeight,
    this.sectionCards = const <Widget>[],
  })  : assert(sections != null),
        assert(sectionCards != null),
        assert(sectionCards.length == sections.length),
        assert(sectionIndex >= 0 && sectionIndex < sections.length),
        assert(selectedIndex != null),
        assert(selectedIndex.value >= 0.0 &&
            selectedIndex.value < sections.length.toDouble()),
        super(key: key, listenable: selectedIndex);

  final int sectionIndex;
  final List<Section> sections;
  final ValueNotifier<double> selectedIndex;
  final double minHeight;
  final double midHeight;
  final double maxHeight;
  final List<Widget> sectionCards;

  double _selectedIndexDelta(int index) {
    return (index.toDouble() - selectedIndex.value).abs().clamp(0.0, 1.0);
  }

  Widget _build(BuildContext context, BoxConstraints constraints) {
    final Size size = constraints.biggest;

    // The layout's progress from from a column to a row. Its value is
    // 0.0 when size.height equals the maxHeight, 1.0 when the size.height
    // equals the midHeight.
    // The layout's progress from from a column to a row. Its value is
    // 0.0 when size.height equals the maxHeight, 1.0 when the size.height
    // equals the midHeight.
    final double tColumnToRow = 1.0 -
        ((size.height - midHeight) / (maxHeight - midHeight)).clamp(0.0, 1.0);

    // The layout's progress from from the midHeight row layout to
    // a minHeight row layout. Its value is 0.0 when size.height equals
    // midHeight and 1.0 when size.height equals minHeight.
    final double tCollapsed = 1.0 -
        ((size.height - minHeight) / (midHeight - minHeight)).clamp(0.0, 1.0);

    double _indicatorOpacity(int index) {
      return 1.0 - _selectedIndexDelta(index) * 0.5;
    }

    double _titleOpacity(int index) {
      return 1.0 - _selectedIndexDelta(index) * tColumnToRow * 0.5;
    }

    double _titleScale(int index) {
      return 1.0 - _selectedIndexDelta(index) * tColumnToRow * 0.15;
    }

    final List<Widget> children = new List<Widget>.from(sectionCards);

    for (int index = 0; index < sections.length; index++) {
      final Section section = sections[index];
      children.add(new LayoutId(
        id: 'title$index',
        child: new SectionTitle(
          section: section,
          scale: _titleScale(index),
          opacity: _titleOpacity(index),
        ),
      ));
    }

    for (int index = 0; index < sections.length; index++) {
      children.add(new LayoutId(
        id: 'indicator$index',
        child: new SectionIndicator(
          opacity: _indicatorOpacity(index),
        ),
      ));
    }

    return new CustomMultiChildLayout(
      delegate: new _AllSectionsLayout(
        translation: new Alignment(
            (selectedIndex.value - sectionIndex) * 2.0 - 1.0, -1.0),
        tColumnToRow: tColumnToRow,
        tCollapsed: tCollapsed,
        cardCount: sections.length,
        selectedIndex: selectedIndex.value,
      ),
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(builder: _build);
  }
}

// Support snapping scrolls to the midScrollOffset: the point at which the
// app bar's height is _kAppBarMidHeight and only one section heading is
// visible.
class _SnappingScrollPhysics extends ClampingScrollPhysics {
  const _SnappingScrollPhysics({
    ScrollPhysics parent,
    @required this.midScrollOffset,
  })  : assert(midScrollOffset != null),
        super(parent: parent);

  final double midScrollOffset;

  @override
  _SnappingScrollPhysics applyTo(ScrollPhysics ancestor) {
    return new _SnappingScrollPhysics(
        parent: buildParent(ancestor), midScrollOffset: midScrollOffset);
  }

  Simulation _toMidScrollOffsetSimulation(double offset, double dragVelocity) {
    final double velocity = math.max(dragVelocity, minFlingVelocity);
    return new ScrollSpringSimulation(spring, offset, midScrollOffset, velocity,
        tolerance: tolerance);
  }

  Simulation _toZeroScrollOffsetSimulation(double offset, double dragVelocity) {
    final double velocity = math.max(dragVelocity, minFlingVelocity);
    return new ScrollSpringSimulation(spring, offset, 0.0, velocity,
        tolerance: tolerance);
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double dragVelocity) {
    final Simulation simulation =
        super.createBallisticSimulation(position, dragVelocity);
    final double offset = position.pixels;

    if (simulation != null) {
      // The drag ended with sufficient velocity to trigger creating a simulation.
      // If the simulation is headed up towards midScrollOffset but will not reach it,
      // then snap it there. Similarly if the simulation is headed down past
      // midScrollOffset but will not reach zero, then snap it to zero.
      final double simulationEnd = simulation.x(double.infinity);
      if (simulationEnd >= midScrollOffset) return simulation;
      if (dragVelocity > 0.0)
        return _toMidScrollOffsetSimulation(offset, dragVelocity);
      if (dragVelocity < 0.0)
        return _toZeroScrollOffsetSimulation(offset, dragVelocity);
    } else {
      // The user ended the drag with little or no velocity. If they
      // didn't leave the offset above midScrollOffset, then
      // snap to midScrollOffset if they're more than halfway there,
      // otherwise snap to zero.
      final double snapThreshold = midScrollOffset / 2.0;
      if (offset >= snapThreshold && offset < midScrollOffset)
        return _toMidScrollOffsetSimulation(offset, dragVelocity);
      if (offset > 0.0 && offset < snapThreshold)
        return _toZeroScrollOffsetSimulation(offset, dragVelocity);
    }
    return simulation;
  }
}

class GearScrollHome extends StatefulWidget {
  const GearScrollHome({Key key}) : super(key: key);

  static const String routeName = '/animation';

  @override
  _GearScrollHomeState createState() => new _GearScrollHomeState();
}

class _GearScrollHomeState extends State<GearScrollHome> {
  final ScrollController _scrollController = new ScrollController();
  final Map<String, ScrollController> pageScroll =
      new Map<String, ScrollController>();
  final PageController _headingPageController = new PageController();
  final PageController _detailsPageController = new PageController();
  ScrollPhysics _headingScrollPhysics = const NeverScrollableScrollPhysics();
  ValueNotifier<double> selectedIndex = new ValueNotifier<double>(0.0);
  ScrollPhysics innerScrollPhysics = NeverScrollableScrollPhysics();
  int curentView = 0;

  onViewChanged(int newView){
    setState(() {
     curentView =newView; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: _kAppBackgroundColor,
      body: new Builder(
        // Insert an element so that _buildBody can find the PrimaryScrollController.
        builder: _buildBody,
      ),
    );
  }

  void _handleBackButton(double midScrollOffset) {
    if (_scrollController.offset >= midScrollOffset)
      _scrollController.animateTo(0.0,
          curve: _kScrollCurve, duration: _kScrollDuration);
    else
      Navigator.maybePop(context);
  }

  // Only enable paging for the heading when the user has scrolled to midScrollOffset.
  // Paging is enabled/disabled by setting the heading's PageView scroll physics.
  bool _handleScrollNotification(
      ScrollNotification notification, double midScrollOffset) {
    if (notification.depth == 0 && notification is ScrollUpdateNotification) {
      if (_scrollController.position.pixels >= (_kAppBarMaxHeight - 55)) {
        setState(() {
          innerScrollPhysics = ClampingScrollPhysics();
        });
      }
      final ScrollPhysics physics =
          _scrollController.position.pixels >= midScrollOffset
              ? const PageScrollPhysics()
              : const NeverScrollableScrollPhysics();
      if (physics != _headingScrollPhysics) {
        setState(() {
          _headingScrollPhysics = physics;
        });
      }
    }
    return false;
  }

  void _maybeScroll(double midScrollOffset, int pageIndex, double xOffset) {
    if (_scrollController.offset < midScrollOffset) {
      // Scroll the overall list to the point where only one section card shows.
      // At the same time scroll the PageViews to the page at pageIndex.
      _headingPageController.animateToPage(pageIndex,
          curve: _kScrollCurve, duration: _kScrollDuration);
      _scrollController.animateTo(midScrollOffset,
          curve: _kScrollCurve, duration: _kScrollDuration);
    } else {
      // One one section card is showing: scroll one page forward or back.
      final double centerX =
          _headingPageController.position.viewportDimension / 2.0;
      final int newPageIndex =
          xOffset > centerX ? pageIndex + 1 : pageIndex - 1;
      _headingPageController.animateToPage(newPageIndex,
          curve: _kScrollCurve, duration: _kScrollDuration);
    }
  }

  bool _handleInnerNotification(notification, ScrollController controller) {
    if (notification.depth == 0 && notification is ScrollUpdateNotification) {
      if (controller.position.pixels <= 0.1) {
        setState(() {
          innerScrollPhysics = NeverScrollableScrollPhysics();
        });
      }
    }
    return false;
  }

  bool _handlePageNotification(ScrollNotification notification,
      PageController leader, PageController follower) {
    if (notification.depth == 0 && notification is ScrollUpdateNotification) {
      selectedIndex.value = leader.page;
      if (follower.page != leader.page)
        follower.position.jumpToWithoutSettling(
            leader.position.pixels); // ignore: deprecated_member_use
    }
    if (notification.depth == 1 && notification is ScrollStartNotification) {}
    return false;
  }

  Iterable<Widget> _allHeadingItems(
      double maxHeight, double midScrollOffset, List<Section> allSections) {
    final List<Widget> sectionCards = <Widget>[];
    for (int index = 0; index < allSections.length; index++) {
      sectionCards.add(new LayoutId(
        id: 'card$index',
        child: new GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: new SectionCard(section: allSections[index]),
            onTapUp: (TapUpDetails details) {
              final double xOffset = details.globalPosition.dx;
              setState(() {
                _maybeScroll(midScrollOffset, index, xOffset);
              });
            }),
      ));
    }

    final List<Widget> headings = <Widget>[];
    for (int index = 0; index < allSections.length; index++) {
      headings.add(new Container(
        color: _kAppBackgroundColor,
        child: new ClipRect(
          child: new _AllSectionsView(
            sectionIndex: index,
            sections: allSections,
            selectedIndex: selectedIndex,
            minHeight: _kAppBarMinHeight,
            midHeight: _kAppBarMidHeight,
            maxHeight: maxHeight,
            sectionCards: sectionCards,
          ),
        ),
      ));
    }
    return headings;
  }

  Widget _buildBody(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double statusBarHeight = mediaQueryData.padding.top;
    final double screenHeight = mediaQueryData.size.height;
    final double appBarMaxHeight = screenHeight - statusBarHeight - 50;
    DataProvider dataProvider = DataProvider.getData(context);
    GearBloc gearBloc = dataProvider.gearBloc;
    Map<int, ScrollController> innerScrollControllers =
        new Map<int, ScrollController>();
    innerScrollControllers[0] = ScrollController();
    innerScrollControllers[1] = ScrollController();
    innerScrollControllers[2] = ScrollController();
    innerScrollControllers[3] = ScrollController();
    innerScrollControllers[4] = ScrollController();
    innerScrollControllers[5] = ScrollController();
    List<Section> allSections =
        getAllSections(gearBloc, innerScrollPhysics, innerScrollControllers,curentView,onViewChanged);
    // The scroll offset that reveals the appBarMidHeight appbar.
    final double appBarMidScrollOffset =
        statusBarHeight + appBarMaxHeight - _kAppBarMidHeight;

    return new SizedBox.expand(
      child: new Stack(
        children: <Widget>[
          new NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              return _handleScrollNotification(
                  notification, appBarMidScrollOffset);
            },
            child: new CustomScrollView(
              controller: _scrollController,
              physics: new _SnappingScrollPhysics(
                  midScrollOffset: appBarMidScrollOffset),
              slivers: <Widget>[
                // Start out below the status bar, gradually move to the top of the screen.
                new _StatusBarPaddingSliver(
                  maxHeight: statusBarHeight,
                  scrollFactor: 7.0,
                ),
                // Section Headings
                new SliverPersistentHeader(
                  pinned: true,
                  delegate: new _SliverAppBarDelegate(
                    minHeight: _kAppBarMinHeight,
                    maxHeight: appBarMaxHeight,
                    child: new NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification notification) {
                        return _handlePageNotification(notification,
                            _headingPageController, _detailsPageController);
                      },
                      child: new PageView(
                        physics: _headingScrollPhysics,
                        controller: _headingPageController,
                        children: _allHeadingItems(appBarMaxHeight,
                            appBarMidScrollOffset, allSections),
                      ),
                    ),
                  ),
                ),
                // Details
                new SliverToBoxAdapter(
                  child: new SizedBox(
                    height: _kAppBarMaxHeight,
                    child: new NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification notification) {
                        return _handlePageNotification(notification,
                            _detailsPageController, _headingPageController);
                      },
                      child: new PageView(
                        controller: _detailsPageController,
                        children: allSections.map((Section section) {
                          return NotificationListener<ScrollNotification>(
                              onNotification:
                                  (ScrollNotification notification) {
                                _handleInnerNotification(
                                    notification,
                                    innerScrollControllers[
                                        _detailsPageController.page]);
                              },
                              child: section.child);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Positioned(
            top: statusBarHeight,
            left: 0.0,
            child: new IconTheme(
              data: const IconThemeData(color: Colors.white),
              child: new SafeArea(
                top: false,
                bottom: false,
                child: new IconButton(
                    icon: const BackButtonIcon(),
                    tooltip: 'Back',
                    onPressed: () {
                      _handleBackButton(appBarMidScrollOffset);
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
