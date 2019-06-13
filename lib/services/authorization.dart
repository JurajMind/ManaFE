import 'dart:async';
import 'dart:convert';

import 'package:app/app/app.dart';
import 'package:app/app/app.widget.dart';
import 'package:app/pages/home.page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:openapi/api.dart';

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

  Future<String> authorize(String userName, String password) async {
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
      return null;
    }

    final responseJson = json.decode(response.body);
    var sucess = await writeToken(responseJson);
    if (sucess != null) {
      await _storage.write(key: 'password', value: password);
    }
    return sucess;
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
        "https://${App.baseUri}/Account/ObtainLocalAccessToken?provider=$provider&externalAccessToken=$externalToken");
    final responseJson = json.decode(response.body);
    var success = await writeToken(responseJson);
    if (success != null) {
      return true;
    }
    return false;
  }

  Future signOut() async {
    await _storage.delete(key: 'accessToken');
    await _storage.delete(key: 'refreshToken');
    await _storage.delete(key: 'userName');
    await _storage.delete(key: 'password');
    navigatorKey.currentState.pushReplacementNamed('auth/home');
    _token = null;
  }

  messToken() async {
    _token = "token";
    await _storage.write(key: 'accessToken', value: 'token');
  }

  Future<String> refreshToken() async {
    var refreshToken = await _storage.read(key: 'refreshToken');
    // await _storage.delete(key: 'accessToken');
    // await _storage.delete(key: 'refreshToken');
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
    if (responseJson['error'] != null) {
      var password = await _storage.read(key: 'password');
      var userName = await _storage.read(key: 'userName');
      var reAuthorize = await this.authorize(userName, password);
      if (reAuthorize != null) return reAuthorize;

      await _storage.delete(key: 'refreshToken');
      await _storage.delete(key: 'accessToken');
      AppWidget.restartApp(scaffoldKey.currentContext);
    }

    var success = await writeToken(responseJson);
    if (success != null) {
      return success;
    }

    AppWidget.restartApp(scaffoldKey.currentContext);
    return null;
  }

  Future<String> register(UserModel userData) async {
    _token = null;
    final response = await http.post(
      'https://${App.baseUri}/api/Account/Register',
      body: {
        "Email": userData.email,
        "UserName": userData.userName,
        "Password": userData.password,
        "ConfirmPassword": userData.confirmPassword,
      },
    );
    final responseJson = json.decode(response.body);

    var success = await writeToken(responseJson);
    if (success != null) {
      return null;
    }
    return "ERROR";
  }

  Future<String> writeToken(dynamic responseJson) async {
    var token = TokenResponse.fromJson(responseJson as Map<String, dynamic>);
    if (token.accessToken != null) {
      await _storage.write(key: 'accessToken', value: token.accessToken);
      if (token.refreshToken != null)
        await _storage.write(key: 'refreshToken', value: token.refreshToken);

      await _storage.write(key: 'userName', value: token.userName);
      // OneSignal.shared.sendTag('user_id', token.userName);

      return token.accessToken;
    }
    return null;
  }

  Future<bool> isAuthorized() async {
    //TODO api ping
    var token = await getToken();
    return token != null;
  }
}

class AuthorizationPost {
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
