import 'package:flutter/cupertino.dart';

class SnapScrollPhysic extends ScrollPhysics {
  final List<double> snaps;

  /// Creates physics for a [PageView].
  const SnapScrollPhysic({ScrollPhysics parent, this.snaps})
      : super(parent: parent);

  @override
  SnapScrollPhysic applyTo(ScrollPhysics ancestor) {
    return new SnapScrollPhysic(
        parent: buildParent(ancestor), snaps: this.snaps);
  }

  double _getPage(ScrollPosition position) {
    return position.pixels / position.viewportDimension;
  }

  double _snapPosition(int position) {
    var result = 0.0;
    for (var i = 0; i < position; i++) {
      result += snaps[i];
    }

    return result;
  }

  double _goToSnap(int position) {
    if (position == 0) {
      return 0.0;
    }
    if (position == snaps.length) {
      return 1000.0;
    }

    double result = 0.0;
    for (var i = 0; i < position; i++) {
      result += snaps[i];
    }
    result -= snaps[position] / 4;
    return result;
  }

  double _getPixels(ScrollPosition position, double page) {
    return page * position.viewportDimension;
  }

  double _getClosestSnap(
      ScrollPosition position, Tolerance tolerance, double velocity) {
    print("position:${position.pixels}");

    for (var i = 0; i < snaps.length; i++) {
      var snapPosition = _snapPosition(i);
      print("snapPosition:${snapPosition}");
      if (position.pixels <= _snapPosition(i)) {
        return _goToSnap(i);
      }
    }
    return position.pixels;
  }

  double _getTargetPixels(
      ScrollPosition position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity)
      page -= 0.5;
    else if (velocity > tolerance.velocity) page += 0.5;
    return _getPixels(position, page.roundToDouble());
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
      return super.createBallisticSimulation(position, velocity);
    final Tolerance tolerance = this.tolerance;
    final double target = _getClosestSnap(position, tolerance, velocity);
    if (target != position.pixels)
      return new ScrollSpringSimulation(
          spring, position.pixels, target, velocity,
          tolerance: tolerance);
    return null;
  }
}
