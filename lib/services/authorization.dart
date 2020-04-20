import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:app/app/app.dart';
import 'package:app/app/app.widget.dart';
import 'package:app/pages/home.page.dart';
import 'package:http/http.dart' as http;
import 'package:openapi/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthorizeManager {
  static final AuthorizeManager _singleton = new AuthorizeManager._internal();
  String url = 'https://${App.baseUri}/token';

  String _token;
  String _userName;

  factory AuthorizeManager() {
    return _singleton;
  }

  AuthorizeManager._internal();

  Future<String> authorize(String userName, String password) async {
    final response = await http.post(
      url,
      body: {"grant_type": "password", "username": userName, "password": password, "client_id": "test"},
    );

    if (response.statusCode != 200) {
      return null;
    }
    var _storage = await SharedPreferences.getInstance();
    final responseJson = json.decode(response.body);
    var sucess = await _writeToken(responseJson);
    if (sucess != null) {
      await _storage.setString('password', password);
    }
    return sucess;
  }

  Future<String> getToken() async {
    if (_token == null) {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      _token = _storage.getString('accessToken');
    }
    return _token;
  }

  Future<String> getUserName() async {
    if (_userName == null) {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      _userName = _storage.getString('userName');
    }
    return _userName;
  }

  Future<bool> getLocalToken(String provider, String externalToken) async {
    var response = await http.get("https://${App.baseUri}/Account/ObtainLocalAccessToken?provider=$provider&externalAccessToken=$externalToken");
    final responseJson = json.decode(response.body);
    var success = await _writeToken(responseJson);
    if (success != null) {
      return true;
    }
    return false;
  }

  Future signOut() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.remove('accessToken');
    await _storage.remove('refreshToken');
    await _storage.remove('userName');
    await _storage.remove('password');
    navigatorKey.currentState.pushReplacementNamed('auth/home');
    _token = null;
  }

  Future<bool> hasToken() async {
    return (await this.getToken()) != null;
  }

  messToken() async {
    _token = "token";
    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.setString('accessToken', 'token');
  }

  Future<String> refreshToken() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    var refreshToken = _storage.getString('refreshToken');
    // await _storage.delete(key: 'accessToken');
    // await _storage.delete(key: 'refreshToken');
    _token = null;
    final response = await http.post(
      url,
      body: {"grant_type": "refresh_token", "refresh_token": refreshToken, "client_id": "test"},
    );
    final responseJson = json.decode(response.body);
    if (responseJson['error'] != null) {
      var password = _storage.getString('password');
      var userName = _storage.getString('userName');
      var reAuthorize = await this.authorize(userName, password);
      if (reAuthorize != null) return reAuthorize;

      await _storage.remove('refreshToken');
      await _storage.remove('accessToken');
      AppWidget.restartApp(scaffoldKey.currentContext);
    }

    var success = await _writeToken(responseJson);
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

    var success = await _writeToken(responseJson);
    if (success != null) {
      return null;
    }
    return "ERROR";
  }

  Future<bool> forgotPassword(String email) async {
    _token = null;
    final response = await http.post(
      'https://${App.baseUri}/api/Account/ForgotPassword',
      body: {"Email": email},
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<String> _writeToken(dynamic responseJson) async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    var token = TokenResponse.fromJson(responseJson as Map<String, dynamic>);
    if (token.accessToken != null) {
      await _storage.setString('accessToken', token.accessToken);
      if (token.refreshToken != null) await _storage.setString('refreshToken', token.refreshToken);

      await _storage.setString('userName', token.userName);
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

  TokenResponse({this.accessToken, this.tokenTtype, this.expiresIn, this.refreshToken, this.userName});

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(accessToken: json['access_token'], tokenTtype: json['token_type'], refreshToken: json['refresh_token'], userName: json['userName']);
  }
}
