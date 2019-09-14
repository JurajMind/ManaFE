import 'dart:async';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:universal_html/html.dart' as html;

import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import 'flutter_secure_storage.dart';

class FlutterSecureStorage {
  const FlutterSecureStorage();

  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
        'plugins.it_nomads.com/flutter_secure_storage',
        const StandardMethodCodec(),
        registrar.messenger);
    final FlutterSecureStorage instance = FlutterSecureStorage();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  /// Encrypts and saves the [key] with the given [value].
  ///
  /// If the key was already in the storage, its associated value is changed.
  /// [value] and [key] shoudn't be null.
  /// [iOptions] optional iOS options
  /// [aOptions] optional Android options
  /// Can throw a [PlatformException].
  Future<void> write(
      {@required String key,
      @required String value,
      iOSOptions iOptions,
      AndroidOptions aOptions}) async {
    html.window.localStorage['key'] = value;
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'write':
        print(call.arguments);
        final String key = call.arguments['key'];
        final String value = call.arguments['value'];
        return write(key: key, value: value);
      case 'read':
        final String key = call.arguments['key'];
        return read(key: key);
      case 'delete':
        final String key = call.arguments['key'];
        return delete(key: key);
      default:
        throw PlatformException(
            code: 'Unimplemented',
            details: "The url_launcher plugin for web doesn't implement "
                "the method '${call.method}'");
    }
  }
}

/// Decrypts and returns the value for the given [key] or null if [key] is not in the storage.
///
/// [key] shoudn't be null.
/// [iOptions] optional iOS options
/// [aOptions] optional Android options
/// Can throw a [PlatformException].
Future<String> read(
    {@required String key,
    iOSOptions iOptions,
    AndroidOptions aOptions}) async {
  final value = html.window.localStorage['key'];
  return value;
}

/// Deletes associated value for the given [key].
///
/// [key] shoudn't be null.
/// [iOptions] optional iOS options
/// [aOptions] optional Android options
/// Can throw a [PlatformException].
Future<void> delete(
    {@required String key,
    iOSOptions iOptions,
    AndroidOptions aOptions}) async {
  html.window.localStorage.remove(key);
}

/// Decrypts and returns all keys with associated values.
///
/// [iOptions] optional iOS options
/// [aOptions] optional Android options
/// Can throw a [PlatformException].
Future<Map<String, String>> readAll(
    {iOSOptions iOptions, AndroidOptions aOptions}) async {
  final results = html.window.localStorage
      .map((a, b) => new MapEntry<String, String>(a, b));
  return results;
}

/// Deletes all keys with associated values.
///
/// [iOptions] optional iOS options
/// [aOptions] optional Android options
/// Can throw a [PlatformException].
Future<void> deleteAll({iOSOptions iOptions, AndroidOptions aOptions}) async {
  html.window.localStorage.clear();
}
