import 'dart:math';
import 'package:app/models/tobacco_mix.dart';
import 'package:app/module/mixology/mixology_page.dart';

class MixologySlice {
  final List<MixologyPage> _pages;

  final int startIndex;

  final bool hasNext;

  MixologySlice(this._pages, this.hasNext)
      : startIndex = _pages.map((p) => p.startIndex).fold(0x7FFFFFFF, min);

  const MixologySlice.empty()
      : _pages = const [],
        startIndex = 0,
        hasNext = true;

  int get endIndex =>
      startIndex + _pages.map((page) => page.endIndex).fold(-1, max);

  /// Returns the product at [index], or `null` if data isn't loaded yet.
  TobaccoMix elementAt(int index) {
    for (final page in _pages) {
      if (index >= page.startIndex && index <= page.endIndex) {
        return page.tobaccoMixes[index - page.startIndex];
      }
    }
    return null;
  }
}
