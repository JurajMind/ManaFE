@JS()
library support;

import 'package:js/js.dart';

@JS("manaFbLogin")
external String fbWebLogin();

@JS("manaGoogleLogin")
external String googleWebLogin();

@JS("callback")
external set fbCallback(Function(String token) f);
