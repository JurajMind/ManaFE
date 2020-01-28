import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tuple/tuple.dart';

/// Created by Marcin Szałek

///NumberPicker is a widget designed to pick a number between #minValue and #maxValue
class WheelPicker extends StatelessWidget {
  ///height of every list element
  static const double DEFAULT_ITEM_EXTENT = 50.0;

  ///width of list view
  static const double DEFAULT_LISTVIEW_WIDTH = 100.0;

  ///constructor for integer number picker
  WheelPicker.integer({
    Key key,
    @required int initialValue,
    @required this.minValue,
    @required this.maxValue,
    @required this.onChanged,
    this.itemExtent = DEFAULT_ITEM_EXTENT,
    this.listViewWidth = DEFAULT_LISTVIEW_WIDTH,
    this.step = 1,
  })  : assert(initialValue != null),
        assert(minValue != null),
        assert(maxValue != null),
        assert(maxValue > minValue),
        assert(initialValue >= minValue && initialValue <= maxValue),
        assert(step > 0),
        selectedIntValue = initialValue,
        selectedDecimalValue = -1,
        decimalPlaces = 0,
        intScrollController = new ScrollController(
          initialScrollOffset: (initialValue - minValue) ~/ step * itemExtent,
        ),
        decimalScrollController = null,
        stringScrollController = null,
        _listViewHeight = 3 * itemExtent,
        stringItems = null,
        tupleItems = null,
        disableItems = null,
        super(key: key);

  WheelPicker.string({
    Key key,
    @required int initialValue,
    @required this.onChanged,
    @required this.stringItems,
    this.itemExtent = DEFAULT_ITEM_EXTENT,
    this.listViewWidth = DEFAULT_LISTVIEW_WIDTH,
    this.disableItems,
    this.step = 1,
  })  : assert(stringItems != null),
        selectedIntValue = initialValue,
        minValue = 0,
        selectedDecimalValue = -1,
        decimalPlaces = 0,
        maxValue = stringItems.length,
        intScrollController = new ScrollController(
          initialScrollOffset: (initialValue) ~/ step * itemExtent,
        ),
        decimalScrollController = null,
        stringScrollController = null,
        _listViewHeight = 3 * itemExtent,
        tupleItems = null,
        super(key: key);

  ///constructor for decimal number picker
  WheelPicker.decimal({
    Key key,
    @required double initialValue,
    @required this.minValue,
    @required this.maxValue,
    @required this.onChanged,
    this.decimalPlaces = 1,
    this.itemExtent = DEFAULT_ITEM_EXTENT,
    this.listViewWidth = DEFAULT_LISTVIEW_WIDTH,
  })  : assert(initialValue != null),
        assert(minValue != null),
        assert(maxValue != null),
        assert(decimalPlaces != null && decimalPlaces > 0),
        assert(maxValue > minValue),
        assert(initialValue >= minValue && initialValue <= maxValue),
        selectedIntValue = initialValue.floor(),
        selectedDecimalValue = ((initialValue - initialValue.floorToDouble()) * math.pow(10, decimalPlaces)).round(),
        intScrollController = new ScrollController(
          initialScrollOffset: (initialValue.floor() - minValue) * itemExtent,
        ),
        decimalScrollController = new ScrollController(
          initialScrollOffset: ((initialValue - initialValue.floorToDouble()) * math.pow(10, decimalPlaces)).roundToDouble() * itemExtent,
        ),
        _listViewHeight = 3 * itemExtent,
        step = 1,
        stringItems = null,
        disableItems = null,
        stringScrollController = null,
        tupleItems = null,
        super(key: key);

  ///called when selected value changes
  final ValueChanged<num> onChanged;

  ///min value user can pick
  final int minValue;

  ///max value user can pick
  final int maxValue;

  final List<String> stringItems;

  final List<String> disableItems;

  final List<Tuple2<String, bool>> tupleItems;

  ///inidcates how many decimal places to show
  /// e.g. 0=>[1,2,3...], 1=>[1.0, 1.1, 1.2...]  2=>[1.00, 1.01, 1.02...]
  final int decimalPlaces;

  ///height of every list element in pixels
  final double itemExtent;

  ///view will always contain only 3 elements of list in pixels
  final double _listViewHeight;

  ///width of list view in pixels
  final double listViewWidth;

  ///ScrollController used for integer list
  final ScrollController intScrollController;

  ///ScrollController used for decimal list
  final ScrollController decimalScrollController;

  ///ScrollController used for decimal list
  final ScrollController stringScrollController;

  ///Currently selected integer value
  final int selectedIntValue;

  ///Currently selected decimal value
  final int selectedDecimalValue;

  ///Step between elements. Only for integer datePicker
  ///Examples:
  /// if step is 100 the following elements may be 100, 200, 300...
  /// if min=0, max=6, step=3, then items will be 0, 3 and 6
  /// if min=0, max=5, step=3, then items will be 0 and 3.
  final int step;

  //
  //----------------------------- PUBLIC ------------------------------
  //

  animateInt(int valueToSelect) {
    int diff = valueToSelect - minValue;
    int index = diff ~/ step;
    _animate(intScrollController, index * itemExtent);
  }

  animateDecimal(int decimalValue) {
    _animate(decimalScrollController, decimalValue * itemExtent);
  }

  animateDecimalAndInteger(double valueToSelect) {
    animateInt(valueToSelect.floor());
    animateDecimal(((valueToSelect - valueToSelect.floorToDouble()) * math.pow(10, decimalPlaces)).round());
  }

  //
  //----------------------------- VIEWS -----------------------------
  //

  ///main widget
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    if (decimalPlaces == 0 && stringItems == null) {
      return _integerListView(themeData);
    }
    if (stringItems != null) {
      return _stringListView(themeData);
    }
    return Container();
  }

  Widget _stringListView(ThemeData themeData) {
    TextStyle defaultStyle = themeData.textTheme.bodyText2;
    TextStyle selectedStyle = themeData.textTheme.headline6.copyWith(color: themeData.accentColor);

    int itemCount = stringItems.length + 3;

    return new NotificationListener(
      child: new Container(
        height: _listViewHeight,
        width: listViewWidth,
        child: new ListView.builder(
          controller: intScrollController,
          itemExtent: itemExtent,
          itemCount: itemCount,
          cacheExtent: _calculateCacheExtent(itemCount),
          itemBuilder: (BuildContext context, int index) {
            final int value = _intValueFromIndex(index);

            //define special style for selected (middle) element
            TextStyle itemStyle = value == selectedIntValue ? selectedStyle : defaultStyle;

            var isDisabled = this.disableItems != null &&
                this.stringItems != null &&
                this.stringItems.length > value &&
                value >= 0 &&
                disableItems.contains(this.stringItems[value]);

            // Item is disabled
            if (isDisabled) {
              itemStyle = itemStyle.copyWith(decoration: TextDecoration.lineThrough);
            }
            bool isExtra = index == 0 || value > stringItems.length - 1;

            return isExtra
                ? new Container() //empty first and last element
                : new Center(
                    child: new Text(stringItems == null ? value.toString() : stringItems[value], style: itemStyle),
                  );
          },
        ),
      ),
      onNotification: _onStringNotification,
    );
  }

  Widget _integerListView(ThemeData themeData) {
    TextStyle defaultStyle = themeData.textTheme.bodyText2;
    TextStyle selectedStyle = themeData.textTheme.headline6.copyWith(color: themeData.accentColor);

    int itemCount = (maxValue - minValue) ~/ step + 3;

    return new NotificationListener(
      child: new Container(
        height: _listViewHeight,
        width: listViewWidth,
        child: new ListView.builder(
          controller: intScrollController,
          itemExtent: itemExtent,
          itemCount: itemCount,
          cacheExtent: _calculateCacheExtent(itemCount),
          itemBuilder: (BuildContext context, int index) {
            final int value = _intValueFromIndex(index);

            //define special style for selected (middle) element
            TextStyle itemStyle = value == selectedIntValue ? selectedStyle : defaultStyle;

            // Item is disabled
            if (this.disableItems != null && this.stringItems != null && disableItems.contains(this.stringItems[0])) {
              itemStyle = itemStyle.copyWith(decoration: TextDecoration.lineThrough);
            }
            bool isExtra = index == 0 || index == itemCount - 1;

            return isExtra
                ? new Container() //empty first and last element
                : new Center(
                    child: new Text(stringItems == null ? value.toString() : stringItems[value], style: itemStyle),
                  );
          },
        ),
      ),
      onNotification: _onIntegerNotification,
    );
  }

  //
  // ----------------------------- LOGIC -----------------------------
  //

  int _intValueFromIndex(int index) => minValue + (index - 1) * step;

  bool _onIntegerNotification(Notification notification) {
    if (notification is ScrollNotification) {
      //calculate
      int intIndexOfMiddleElement = (notification.metrics.pixels + _listViewHeight / 2) ~/ itemExtent;
      int intValueInTheMiddle = _intValueFromIndex(intIndexOfMiddleElement);
      intValueInTheMiddle = _normalizeIntegerMiddleValue(intValueInTheMiddle);

      if (_userStoppedScrolling(notification, intScrollController)) {
        //center selected value
        animateInt(intValueInTheMiddle);
      }

      //update selection
      if (intValueInTheMiddle != selectedIntValue) {
        num newValue;
        if (decimalPlaces == 0) {
          //return integer value
          newValue = (intValueInTheMiddle);
        } else {
          if (intValueInTheMiddle == maxValue) {
            //if new value is maxValue, then return that value and ignore decimal
            newValue = (intValueInTheMiddle.toDouble());
            animateDecimal(0);
          } else {
            //return integer+decimal
            double decimalPart = _toDecimal(selectedDecimalValue);
            newValue = ((intValueInTheMiddle + decimalPart).toDouble());
          }
        }
        onChanged(newValue);
      }
    }
    return true;
  }

  bool _onStringNotification(Notification notification) {
    if (notification is ScrollNotification) {
      //calculate
      int intIndexOfMiddleElement = (notification.metrics.pixels + _listViewHeight / 2) ~/ itemExtent;
      int intValueInTheMiddle = _intValueFromIndex(intIndexOfMiddleElement);
      intValueInTheMiddle = _normalizeIntegerMiddleValue(intValueInTheMiddle);

      if (_userStoppedScrolling(notification, intScrollController)) {
        //center selected value
        animateInt(intValueInTheMiddle);
      }

      //update selection
      if (intValueInTheMiddle != selectedIntValue) {
        num newValue;
        if (decimalPlaces == 0) {
          //return integer value
          newValue = (intValueInTheMiddle);
        } else {
          if (intValueInTheMiddle == maxValue) {
            //if new value is maxValue, then return that value and ignore decimal
            newValue = (intValueInTheMiddle.toDouble());
            animateInt(0);
          } else {
            //return integer+decimal
            double decimalPart = _toDecimal(selectedDecimalValue);
            newValue = ((intValueInTheMiddle + decimalPart).toDouble());
          }
        }
        if (newValue >= stringItems.length) {
          animateInt(stringItems.length - 1);
        }

        if (newValue < stringItems.length) onChanged(newValue);
      }
    }
    return true;
  }

  bool _onDecimalNotification(Notification notification) {
    if (notification is ScrollNotification) {
      //calculate middle value
      int indexOfMiddleElement = (notification.metrics.pixels + _listViewHeight / 2) ~/ itemExtent;
      int decimalValueInTheMiddle = indexOfMiddleElement - 1;
      decimalValueInTheMiddle = _normalizeDecimalMiddleValue(decimalValueInTheMiddle);

      if (_userStoppedScrolling(notification, decimalScrollController)) {
        //center selected value
        animateDecimal(decimalValueInTheMiddle);
      }

      //update selection
      if (selectedIntValue != maxValue && decimalValueInTheMiddle != selectedDecimalValue) {
        double decimalPart = _toDecimal(decimalValueInTheMiddle);
        double newValue = ((selectedIntValue + decimalPart).toDouble());
        onChanged(newValue);
      }
    }
    return true;
  }

  ///There was a bug, when if there was small integer range, e.g. from 1 to 5,
  ///When user scrolled to the top, whole listview got displayed.
  ///To prevent this we are calculating cacheExtent by our own so it gets smaller if number of items is smaller
  double _calculateCacheExtent(int itemCount) {
    double cacheExtent = 250.0; //default cache extent
    if ((itemCount - 2) * DEFAULT_ITEM_EXTENT <= cacheExtent) {
      cacheExtent = ((itemCount - 3) * DEFAULT_ITEM_EXTENT);
    }
    return cacheExtent;
  }

  ///When overscroll occurs on iOS,
  ///we can end up with value not in the range between [minValue] and [maxValue]
  ///To avoid going out of range, we change values out of range to border values.
  int _normalizeMiddleValue(int valueInTheMiddle, int min, int max) {
    return math.max(math.min(valueInTheMiddle, max), min);
  }

  int _normalizeIntegerMiddleValue(int integerValueInTheMiddle) {
    //make sure that max is a multiple of step
    int max = (maxValue ~/ step) * step;
    return _normalizeMiddleValue(integerValueInTheMiddle, minValue, max);
  }

  int _normalizeDecimalMiddleValue(int decimalValueInTheMiddle) {
    return _normalizeMiddleValue(decimalValueInTheMiddle, 0, math.pow(10, decimalPlaces) - 1);
  }

  ///indicates if user has stopped scrolling so we can center value in the middle
  bool _userStoppedScrolling(Notification notification, ScrollController scrollController) {
    return notification is UserScrollNotification &&
        notification.direction == ScrollDirection.idle &&
        scrollController.position.activity is! HoldScrollActivity;
  }

  ///converts integer indicator of decimal value to double
  ///e.g. decimalPlaces = 1, value = 4  >>> result = 0.4
  ///     decimalPlaces = 2, value = 12 >>> result = 0.12
  double _toDecimal(int decimalValueAsInteger) {
    return double.parse((decimalValueAsInteger * math.pow(10, -decimalPlaces)).toStringAsFixed(decimalPlaces));
  }

  ///scroll to selected value
  _animate(ScrollController scrollController, double value) {
    scrollController.animateTo(value, duration: new Duration(seconds: 1), curve: new ElasticOutCurve());
  }
}
