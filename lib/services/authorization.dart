import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:app/app/app.dart';
import 'package:app/app/app.widget.dart';
import 'package:app/pages/home.page.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:openapi/api.dart';

import 'package:shared_preferences/shared_preferences.dart';

const String _password = 'password';
const String _usernName = 'userName';
const String _accessToken = 'accessToken';
const String _refreshToken = 'refreshToken';

class AuthorizeRepository {
  final SharedPreferences sharedPreferences;

  String url = 'https://${App.baseUri}/token';

  AuthorizeRepository({@required this.sharedPreferences});

  Future<String> authorize(String userName, String password) async {
    final response = await http.post(
      Uri.parse(url),
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
      await sharedPreferences.setString(_password, password);
    }
    return sucess;
  }

  String getToken() {
    return sharedPreferences.getString(_accessToken);
  }

  String getUserName() {
    return sharedPreferences.getString(_usernName);
  }

  Future<bool> getLocalToken(String provider, String externalToken) async {
    var response = await http.get(Uri.parse(
        "https://${App.baseUri}/Account/ObtainLocalAccessToken?provider=$provider&externalAccessToken=$externalToken"));
    final responseJson = json.decode(response.body);
    var success = await writeToken(responseJson);
    if (success != null) {
      return true;
    }
    return false;
  }

  Future signOut() async {
    await sharedPreferences.remove(_accessToken);
    await sharedPreferences.remove(_refreshToken);
    await sharedPreferences.remove(_usernName);
    await sharedPreferences.remove(_password);
  }

  messToken() async {
    await sharedPreferences.setString(_accessToken, 'token');
  }

  Future<String> refreshToken() async {
    var refreshToken = sharedPreferences.getString(_refreshToken);
    // await _storage.delete(key: 'accessToken');
    // await _storage.delete(key: 'refreshToken');

    final response = await http.post(
      Uri.parse(url),
      body: {
        "grant_type": "refresh_token",
        "refresh_token": refreshToken,
        "client_id": "test"
      },
    );
    final responseJson = json.decode(response.body);
    if (responseJson['error'] != null) {
      var password = sharedPreferences.getString(_password);
      var userName = sharedPreferences.getString(_usernName);
      if (password != null) {
        var reAuthorize = await this.authorize(userName, password);
        if (reAuthorize != null) return reAuthorize;
      }

      await sharedPreferences.remove(_refreshToken);
      await sharedPreferences.remove(_accessToken);
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
    final response = await http.post(
      Uri.parse('https://${App.baseUri}/api/Account/Register'),
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

  Future<bool> forgotPassword(String email) async {
    final response = await http.post(
      Uri.parse('https://${App.baseUri}/api/Account/ForgotPassword'),
      body: {"Email": email},
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<String> writeToken(dynamic responseJson) async {
    var token = TokenResponse.fromJson(responseJson as Map<String, dynamic>);
    if (token.accessToken != null) {
      await sharedPreferences.setString(_accessToken, token.accessToken);
      if (token.refreshToken != null)
        await sharedPreferences.setString(_refreshToken, token.refreshToken);

      await sharedPreferences.setString(
          _usernName, token.userName ?? 'No user name');

      return token.accessToken;
    }
    return null;
  }

  bool isAuthorized() {
    var token = getToken();
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
