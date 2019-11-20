import 'dart:io';

class MPlatform {
  static const bool kIsWeb = identical(0, 0.0);
  static final bool isIOS = ((!kIsWeb) && Platform.isIOS);
  static final bool isAndroid = ((!kIsWeb) && Platform.isAndroid);
  static final bool isWeb = (kIsWeb);
}
