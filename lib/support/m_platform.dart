import 'dart:io';

import 'package:flutter/foundation.dart';

class MPlatform {
  static final bool isIOS = ((!kIsWeb) && Platform.isIOS);
  static final bool isAndroid = ((!kIsWeb) && Platform.isAndroid);
  static final bool isWeb = (kIsWeb);
}
