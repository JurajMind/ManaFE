import 'dart:async';
import 'dart:convert';

import 'package:app/app/app.dart';
import 'package:app/app/app.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Authorize {
  String url = 'https://${App.baseUri}/token';
  final _storage = new FlutterSecureStorage();
  String _token;

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
    final responseJson = json.decode(response.body);
    var token = TokenResponse.fromJson(responseJson);

    if (token.accessToken != null) {
      await _storage.write(key: 'accessToken', value: token.accessToken);
      await _storage.write(key: 'refreshToken', value: token.refreshToken);
      return true;
    }

    return false;
  }

  Future<String> getToken() async {
    if (_token == null) {
      _token = await _storage.read(key: 'accessToken');
    }
    return _token;
  }

  Future signOut() async {
    await _storage.delete(key: 'accessToken');
    navigatorKey.currentState.pushReplacementNamed('auth/login');
  }

  Future<bool> refreshToken() async {
    var refreshToken = await _storage.read(key: 'refreshToken');
    await _storage.delete(key: 'accessToken');
    await _storage.delete(key: 'refreshToken');

    final response = await http.post(
      url,
      body: {
        "grant_type": "refresh_token",
        "refresh_token": refreshToken,
        "client_id": "test"
      },
    );
    final responseJson = json.decode(response.body);

    var token = TokenResponse.fromJson(responseJson);
    if (token.accessToken != null) {
      await _storage.write(key: 'accessToken', value: token.accessToken);
      await _storage.write(key: 'refreshToken', value: token.refreshToken);
      return true;
    }

    navigatorKey.currentState.pushReplacementNamed('auth/login');
    return false;
  }

  Future<bool> isAuthorized() async {
    //TODO api ping
    var token = await getToken();
    return token != null;
  }
}

class AuthorizationPost {
  String _grant_type = "grant_type";
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
        expiresIn: json['expires_in'],
        refreshToken: json['refresh_token'],
        userName: json['userName']);
  }
}
