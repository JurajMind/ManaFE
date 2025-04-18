import 'dart:math' as math;
import 'dart:ui';

import 'package:app/utils/numbers_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/scheduler.dart';

class SpringySlider extends StatefulWidget {
  final int? markCount;
  final Color? positiveColor;
  final Color? negativeColor;
  final IconData? positiveIcon;
  final IconData? negativeIcon;
  final double minValue;
  final double maxValue;
  final double initValue;
  final ValueChanged<double>? onChanged;
  SpringySlider({
    this.markCount,
    this.positiveColor,
    this.negativeColor,
    this.onChanged,
    this.positiveIcon,
    this.negativeIcon,
    this.minValue = 0.0,
    this.maxValue = 1.0,
    this.initValue = 0.5,
  });

  @override
  _SpringySliderState createState() => new _SpringySliderState();
}

class _SpringySliderState extends State<SpringySlider> with TickerProviderStateMixin {
  final double paddingTop = 50.0;
  final double paddingBottom = 50.0;

  SpringySliderController? sliderController;

  @override
  void initState() {
    super.initState();
    sliderController = new SpringySliderController(
      sliderPercent: NumberHelper.normalize(widget.initValue, widget.minValue, widget.maxValue),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SliderDragger(
      sliderController: sliderController,
      paddingTop: paddingTop,
      paddingBottom: paddingBottom,
      onChanged: widget.onChanged,
      minValue: widget.minValue,
      maxValue: widget.maxValue,
      child: Stack(
        children: <Widget>[
          SliderMarks(
            markCount: widget.markCount,
            markColor: widget.positiveColor,
            backgroundColor: widget.negativeColor,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
          ),
          SliderGoo(
            sliderController: sliderController,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
            child: SliderMarks(
              markCount: widget.markCount,
              markColor: widget.negativeColor,
              backgroundColor: widget.positiveColor,
              paddingTop: paddingTop,
              paddingBottom: paddingBottom,
            ),
          ),
          new SliderPoints(
            sliderController: sliderController,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
            positiveIcon: widget.positiveIcon,
            negativeIcon: widget.negativeIcon,
          ),
//          new SliderDebug(
//            sliderPercent: sliderController.state == SpringySliderState.dragging
//                ? sliderController.draggingPercent
//                : sliderPercent,
//            paddingTop: paddingTop,
//            paddingBottom: paddingBottom,
//          ),
        ],
      ),
    );
  }
}

class SliderDebug extends StatelessWidget {
  final double? sliderPercent;
  final double? paddingTop;
  final double? paddingBottom;

  SliderDebug({
    this.sliderPercent,
    this.paddingTop,
    this.paddingBottom,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final height = constraints.maxHeight - paddingTop! - paddingBottom!;

        return Stack(
          children: <Widget>[
            Positioned(
              left: 0.0,
              right: 0.0,
              top: height * (1.0 - sliderPercent!) + paddingTop!,
              child: Container(
                height: 2.0,
                color: Colors.black,
              ),
            )
          ],
        );
      },
    );
  }
}

class SliderDragger extends StatefulWidget {
  final SpringySliderController? sliderController;
  final double? paddingTop;
  final double? paddingBottom;
  final double? minValue;
  final double? maxValue;
  final Widget? child;
  final ValueChanged<double>? onChanged;
  SliderDragger(
      {this.sliderController,
      this.paddingTop,
      this.paddingBottom,
      this.child,
      this.onChanged,
      this.minValue,
      this.maxValue});

  @override
  _SliderDraggerState createState() => _SliderDraggerState();
}

class _SliderDraggerState extends State<SliderDragger> {
  double? startDragY;
  double? startDragPercent;

  void _onPanStart(DragStartDetails details) {
    startDragY = details.globalPosition.dy;
    startDragPercent = widget.sliderController!.sliderValue;

    final sliderWidth = context.size!.width;
    final sliderLeftPosition = (context.findRenderObject() as RenderBox).localToGlobal(const Offset(0.0, 0.0)).dx;
    final dragHorizontalPercent = (details.globalPosition.dx - sliderLeftPosition) / sliderWidth;

    widget.sliderController!.onDragStart(dragHorizontalPercent);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final dragDistance = startDragY! - details.globalPosition.dy;
    final sliderHeight = context.size!.height - widget.paddingTop! - widget.paddingBottom!;
    final dragPercent = dragDistance / sliderHeight;

    final sliderWidth = context.size!.width;
    final sliderLeftPosition = (context.findRenderObject() as RenderBox).localToGlobal(const Offset(0.0, 0.0)).dx;
    final dragHorizontalPercent = (details.globalPosition.dx - sliderLeftPosition) / sliderWidth;

    widget.sliderController!.draggingPercents = new Offset(
      dragHorizontalPercent,
      startDragPercent! + dragPercent,
    );
  }

  void _onPanEnd(DragEndDetails details) {
    startDragY = null;
    startDragPercent = null;

    widget.sliderController!.onDragEnd();
    widget.onChanged!(
        NumberHelper.deNormalize(widget.sliderController!.sliderValue!, widget.minValue!, widget.maxValue!));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: widget.child,
    );
  }
}

class SliderGoo extends StatelessWidget {
  final SpringySliderController? sliderController;
  final double? paddingTop;
  final double? paddingBottom;
  final Widget? child;

  SliderGoo({
    this.sliderController,
    this.paddingTop,
    this.paddingBottom,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SliderClipper(
        sliderController: sliderController,
        paddingTop: paddingTop,
        paddingBottom: paddingBottom,
      ),
      child: child,
    );
  }
}

class SliderMarks extends StatelessWidget {
  final int? markCount;
  final Color? markColor;
  final Color? backgroundColor;
  final double? paddingTop;
  final double? paddingBottom;

  SliderMarks({
    this.markCount,
    this.markColor,
    this.backgroundColor,
    this.paddingTop,
    this.paddingBottom,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: new SliderMarksPainter(
        markCount: markCount,
        markColor: markColor!,
        backgroundColor: backgroundColor!,
        markThickness: 2.0,
        paddingTop: paddingTop,
        paddingBottom: paddingBottom,
        paddingRight: 20.0,
      ),
      child: Container(),
    );
  }
}

class SliderMarksPainter extends CustomPainter {
  final double largeMarkWidth = 30.0;
  final double smallMarkWidth = 10.0;

  final int? markCount;
  final Color markColor;
  final Color backgroundColor;
  final double markThickness;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingRight;
  final Paint markPaint;
  final Paint backgroundPaint;

  SliderMarksPainter({
    this.markCount,
    required this.markColor,
    required this.backgroundColor,
    required this.markThickness,
    this.paddingTop,
    this.paddingBottom,
    this.paddingRight,
  })  : markPaint = new Paint()
          ..color = markColor
          ..strokeWidth = markThickness
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round,
        backgroundPaint = new Paint()
          ..color = backgroundColor
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTWH(
        0.0,
        0.0,
        size.width,
        size.height,
      ),
      backgroundPaint,
    );

    final paintHeight = size.height - paddingTop! - paddingBottom!;
    final gap = paintHeight / (markCount! - 1);

    for (int i = 0; i < markCount!; ++i) {
      double? markWidth = smallMarkWidth;
      if (i == 0 || i == markCount! - 1) {
        markWidth = largeMarkWidth;
      } else if (i == 1 || i == markCount! - 2) {
        markWidth = lerpDouble(smallMarkWidth, largeMarkWidth, 0.5);
      }

      final markY = i * gap + paddingTop!;

      canvas.drawLine(
        new Offset(size.width - paddingRight! - markWidth!, markY),
        new Offset(size.width - paddingRight!, markY),
        markPaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class SliderClipper extends CustomClipper<Path> {
  final SpringySliderController? sliderController;
  final double? paddingTop;
  final double? paddingBottom;

  SliderClipper({
    this.sliderController,
    this.paddingTop,
    this.paddingBottom,
  });

  @override
  Path getClip(Size size) {
    switch (sliderController!.state) {
      case SpringySliderState.idle:
        return _clipIdle(size);
      case SpringySliderState.dragging:
        return _clipDragging(size);
      case SpringySliderState.springing:
        return _clipIdle(size);
    }
    return _clipIdle(size);
  }

  Path _clipIdle(Size size) {
    Path rect = new Path();

    final top = paddingTop!;
    final bottom = size.height;
    final height = (bottom - paddingBottom!) - top;
    final percentFromBottom = 1.0 - sliderController!.sliderValue!;

    rect.addRect(
      new Rect.fromLTRB(
        0.0,
        top + (percentFromBottom * height),
        size.width,
        bottom,
      ),
    );

    return rect;
  }

  Path _clipDragging(Size size) {
    Path compositePath = new Path();

    final top = paddingTop!;
    final bottom = size.height - paddingBottom!;
    final height = bottom - top;
    final basePercentFromBottom = 1.0 - sliderController!.sliderValue!;
    final dragPercentFromBottom = 1.0 - sliderController!.draggingPercent!;

    final baseY = top + (basePercentFromBottom * height);
    final leftX = -0.15 * size.width;
    final leftPoint = math.Point(leftX, baseY);
    final rightX = 1.15 * size.width;
    final rightPoint = math.Point(rightX, baseY);

    final dragX = sliderController!.draggingHorizontalPercent! * size.width;
    final dragY = top + (dragPercentFromBottom * height);
    final crestPoint = math.Point(dragX, dragY.clamp(top, bottom));

    double? excessDrag = 0.0;
    if (sliderController!.draggingPercent! < 0.0) {
      excessDrag = sliderController!.draggingPercent;
    } else if (sliderController!.draggingPercent! > 1.0) {
      excessDrag = sliderController!.draggingPercent! - 1.0;
    }
    final baseControlPointWidth = 150.0;
    final thickeningFactor = excessDrag! * height * 0.05;
    final controlPointWidth = (200.0 * thickeningFactor).abs() + baseControlPointWidth;

    final rect = new Path();
    rect.moveTo(leftPoint.x, leftPoint.y);
    rect.lineTo(rightPoint.x, rightPoint.y);
    rect.lineTo(rightPoint.x, size.height);
    rect.lineTo(leftPoint.x, size.height);
    rect.lineTo(leftPoint.x, leftPoint.y);
    rect.close();

    compositePath.addPath(rect, const Offset(0.0, 0.0));

    final curve = new Path();
    curve.moveTo(crestPoint.x, crestPoint.y);
    curve.quadraticBezierTo(
      crestPoint.x - controlPointWidth,
      crestPoint.y,
      leftPoint.x,
      leftPoint.y,
    );

    curve.moveTo(crestPoint.x, crestPoint.y);
    curve.quadraticBezierTo(
      crestPoint.x + controlPointWidth,
      crestPoint.y,
      rightPoint.x,
      rightPoint.y,
    );

    curve.lineTo(leftPoint.x, leftPoint.y);
    curve.close();

    if (dragPercentFromBottom > basePercentFromBottom) {
      compositePath.fillType = PathFillType.evenOdd;
    }

    compositePath.addPath(curve, const Offset(0.0, 0.0));

    return compositePath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class SliderPoints extends StatelessWidget {
  final SpringySliderController? sliderController;
  final double? paddingTop;
  final double? paddingBottom;
  final IconData? positiveIcon;
  final IconData? negativeIcon;

  SliderPoints({this.sliderController, this.paddingTop, this.paddingBottom, this.positiveIcon, this.negativeIcon});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double? sliderPercent = sliderController!.sliderValue;
        if (sliderController!.state == SpringySliderState.dragging) {
          sliderPercent = sliderController!.draggingPercent!.clamp(0.0, 1.0);
        }

        final height = constraints.maxHeight - paddingTop! - paddingBottom!;
        final sliderY = height * (1.0 - sliderPercent!) + paddingTop!;
        final pointsYouNeedPercent = 1.0 - sliderPercent;
        final pointsYouNeed = (100 * pointsYouNeedPercent).round();
        final pointsYouHavePercent = sliderPercent;
        final pointsYouHave = 100 - pointsYouNeed;

        return Stack(
          children: <Widget>[
            Positioned(
              left: 30.0,
              top: sliderY - 10.0 - (40.0 * pointsYouNeedPercent),
              child: FractionalTranslation(
                translation: Offset(0.0, -1.0),
                child: new Points(
                  points: pointsYouNeed,
                  isAboveSlider: true,
                  isPointsYouNeed: true,
                  icon: positiveIcon,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              top: sliderY + 10.0 + (40.0 * pointsYouHavePercent),
              child: new Points(
                points: pointsYouHave,
                isAboveSlider: false,
                isPointsYouNeed: false,
                icon: negativeIcon,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ],
        );
      },
    );
  }
}

class Points extends StatelessWidget {
  final int? points;
  final bool isAboveSlider;
  final bool isPointsYouNeed;
  final Color? color;
  final IconData? icon;
  Points({
    this.points,
    this.isAboveSlider = true,
    this.isPointsYouNeed = true,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final percent = points! / 100.0;
    final pointTextSize = 50.0 + (50.0 * percent);

    return Row(
      crossAxisAlignment: isAboveSlider ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        FractionalTranslation(
          translation: Offset(-0.05 * percent, isAboveSlider ? 0.18 : -0.18),
          child: Icon(this.icon, size: pointTextSize),
        ),
      ],
    );
  }
}

class SpringySliderController extends ChangeNotifier {
  final SpringDescription sliderSpring = new SpringDescription(
    mass: 1.0,
    stiffness: 1000.0,
    damping: 30.0,
  );

  final SpringDescription crestSpring = new SpringDescription(
    mass: 1.0,
    stiffness: 5.0,
    damping: 0.5,
  );

  final TickerProvider? _vsync;

  SpringySliderState _state = SpringySliderState.idle;

  // Stable slider value.
  double? _sliderPercent;

  // Slider value during user drag.
  double? _draggingPercent;

  // Slider horizontal value during user drag.
  double? _draggingHorizontalPercent;

  // When springing to new slider value, this is where the UI is springing from.
  double? _springStartPercent;
  // When springing to new slider value, this is where the UI is springing to.
  double? _springEndPercent;
  // Current slider value during spring effect.
  double? _springingPercent;
  // Physics spring.
  late SpringSimulation _sliderSpringSimulation;

  double? _crestSpringingPercent;
  double? _crestSpringingStartPercent;
  double? _crestSpringingEndPercent;
  late SpringSimulation _crestSpringSimulation;

  // Ticker that computes current spring position based on time.
  Ticker? _springTicker;
  // Elapsed time that has passed since the start of the spring.
  late double _springTime;

  SpringySliderController({
    double sliderPercent = 0.0,
    vsync,
  })  : _vsync = vsync,
        _sliderPercent = sliderPercent;

  void dispose() {
    if (_springTicker != null) {
      _springTicker!.dispose();
    }

    super.dispose();
  }

  SpringySliderState get state => _state;

  double? get sliderValue => _sliderPercent;

  set sliderValue(double? newValue) {
    _sliderPercent = newValue;
    notifyListeners();
  }

  double? get draggingPercent => _draggingPercent;

  double? get draggingHorizontalPercent => _draggingHorizontalPercent;

  set draggingPercents(Offset draggingPercents) {
    _draggingHorizontalPercent = draggingPercents.dx;
    _draggingPercent = draggingPercents.dy;
    notifyListeners();
  }

  void onDragStart(double draggingHorizontalPercent) {
    if (_springTicker != null) {
      _springTicker!
        ..stop()
        ..dispose();
    }

    _state = SpringySliderState.dragging;
    _draggingPercent = _sliderPercent;
    _draggingHorizontalPercent = draggingHorizontalPercent;

    notifyListeners();
  }

  void onDragEnd() {
    _state = SpringySliderState.springing;

    _springingPercent = _sliderPercent;
    _springStartPercent = _sliderPercent;
    _springEndPercent = _draggingPercent!.clamp(0.0, 1.0);

    _crestSpringingPercent = draggingPercent;
    _crestSpringingStartPercent = draggingPercent;
    _crestSpringingEndPercent = _springStartPercent;

    _draggingPercent = null;

    _sliderPercent = _springEndPercent;

    _startSpringing();

    notifyListeners();
  }

  void _startSpringing() {
    if (_springStartPercent == _springEndPercent) {
      _state = SpringySliderState.idle;
      notifyListeners();
      return;
    }

    _sliderSpringSimulation = new SpringSimulation(
      sliderSpring,
      _springStartPercent!,
      _springEndPercent!,
      0.0,
    );

    final crestSpringNormal = (_crestSpringingEndPercent! - _crestSpringingStartPercent!) /
        (_crestSpringingEndPercent! - _crestSpringingStartPercent!).abs();
    _crestSpringSimulation = new SpringSimulation(
      crestSpring,
      _crestSpringingStartPercent!,
      _crestSpringingEndPercent!,
      0.5 * crestSpringNormal,
    );

    _springTime = 0.0;

    _springTicker = _vsync!.createTicker(_springTick)..start();

    notifyListeners();
  }

  void _springTick(Duration deltaTime) {
    final lastFrameTime = deltaTime.inMilliseconds.toDouble() / 1000.0;

    _springTime += lastFrameTime;
    _springingPercent = _sliderSpringSimulation.x(_springTime);

    _crestSpringingPercent = _crestSpringSimulation.x(lastFrameTime);
    _crestSpringSimulation = new SpringSimulation(
      crestSpring,
      _crestSpringingPercent!,
      _springingPercent!,
      _crestSpringSimulation.dx(lastFrameTime),
    );

    if (_sliderSpringSimulation.isDone(_springTime) && _crestSpringSimulation.isDone(lastFrameTime)) {
      _springTicker!
        ..stop()
        ..dispose();
      _springTicker = null;

      _state = SpringySliderState.idle;
    }

    notifyListeners();
  }

  double? get springingPercent => _springingPercent;

  double? get crestSpringingPercent => _crestSpringingPercent;
}

enum SpringySliderState {
  idle,
  dragging,
  springing,
}
