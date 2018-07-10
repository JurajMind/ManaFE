import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Authorize{

  final _storage = new FlutterSecureStorage();

Future<bool> authorize(String userName,String password) async {
  final response = await http.post(
    'https://devmana.azurewebsites.net/token',
    body: { "grant_type":"password" , "username":userName,"password":password, "client_id":"test"},
  );
  final responseJson = json.decode(response.body);

  
  var token = TokenResponse.fromJson(responseJson);

  if(token.accessToken!= null)
  {       
        await _storage.write(key: 'accessToken', value: token.accessToken);
        await _storage.write(key: 'refreshToken', value: token.refreshToken);
        return true;
  }

  return false;
}

Future<String> getToken()
{
  return _storage.read(key: 'accessToken');
}

Future<bool> isAuthorized() async{
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