import 'dart:async';
import 'dart:convert';

import 'package:app/app/app.dart';
import 'package:app/app/app.widget.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Authorize {
  static final Authorize _singleton = new Authorize._internal();
  String url = 'https://${App.baseUri}/token';
  final _storage = new FlutterSecureStorage();
  String _token;
  String _userName;

  factory Authorize() {
    return _singleton;
  }

  Authorize._internal();

  Future<bool> authorize(String userName, String password) async {
    final response = await http.post(
      url,
      body: {
        "grant_type": "password",
        "username": userName,
        "password": password,
        "client_id": "test"
      },
    );

    if (response.statusCode != 200) {
      return false;
    }

    final responseJson = json.decode(response.body);
    return await writeToken(responseJson);
  }

  Future<String> getToken() async {
    if (_token == null) {
      _token = await _storage.read(key: 'accessToken');
    }
    return _token;
  }

  Future<String> getUserName() async {
    if (_userName == null) {
      _userName = await _storage.read(key: 'userName');
    }
    return _userName;
  }

  Future<bool> getLocalToken(String provider, String externalToken) async {
    var response = await http.get(
        "https://${App.baseUri}/Account/ObtainLocalAccessToken?provider=${provider}&externalAccessToken=${externalToken}");
    final responseJson = json.decode(response.body);
    var success = await writeToken(responseJson);
    if (success) {
      return true;
    }
    return false;
  }

  Future signOut() async {
    await _storage.delete(key: 'accessToken');
    await _storage.delete(key: 'refreshToken');
    await _storage.delete(key: 'userName');
    navigatorKey.currentState.pushReplacementNamed('auth/home');
    _token = null;
  }

  Future<bool> refreshToken() async {
    var refreshToken = await _storage.read(key: 'refreshToken');
    await _storage.delete(key: 'accessToken');
    await _storage.delete(key: 'refreshToken');
    _token = null;
    final response = await http.post(
      url,
      body: {
        "grant_type": "refresh_token",
        "refresh_token": refreshToken,
        "client_id": "test"
      },
    );
    final responseJson = json.decode(response.body);

    var success = await writeToken(responseJson);
    if (success) {
      return true;
    }

    navigatorKey.currentState.pushReplacementNamed('auth/login');
    return false;
  }

  Future<bool> writeToken(dynamic responseJson) async {
    var token = TokenResponse.fromJson(responseJson as Map<String, dynamic>);
    if (token.accessToken != null) {
      await _storage.write(key: 'accessToken', value: token.accessToken);
      if (token.refreshToken != null)
        await _storage.write(key: 'refreshToken', value: token.refreshToken);

      await _storage.write(key: 'userName', value: token.userName);
      // OneSignal.shared.sendTag('user_id', token.userName);

      return true;
    }
    return false;
  }

  Future<bool> isAuthorized() async {
    //TODO api ping
    var token = await getToken();
    return token != null;
  }
}

class _requireConsent {}

class AuthorizationPost {
  var _grant_type = "grant_type";
  final String username;
  final String password;

  AuthorizationPost({this.username, this.password});
}

class TokenResponse {
  String accessToken;
  String tokenTtype;
  int expiresIn;
  String refreshToken;
  String userName;

  TokenResponse(
      {this.accessToken,
      this.tokenTtype,
      this.expiresIn,
      this.refreshToken,
      this.userName});

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
        accessToken: json['access_token'],
        tokenTtype: json['token_type'],
        refreshToken: json['refresh_token'],
        userName: json['userName']);
  }
}
