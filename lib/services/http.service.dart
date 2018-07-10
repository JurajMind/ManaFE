import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app/models/tobacco_mix.dart';
import 'package:app/services/authorization.dart';

class ApiClient {
  static final _client = ApiClient._internal();
  final _http = HttpClient();
  final Authorize _authorize = new Authorize();
  ApiClient._internal();

  final String baseUrl = 'devmana.azurewebsites.net';

  factory ApiClient() => _client;

  Future<dynamic> _getJson(Uri uri) async {
    var response = (await _http.getUrl(uri).then((HttpClientRequest request) {
      request.headers.add('Authorization', 'Bearer iXpiqKoyLDOyeaKZuDPBlOOb8aMD0bJhR5iza04LEwpAao7Rjc3jSecFv9oa-5uRQuvCj_8PDzW6nMC7TDjJ29cSXpV3TpzblHtepxO5J8PbrMruSPW0FNkJroK-v847YWe6ls96TW5EqE8OLlbuARVWKy8Wp0iPlynsxX_eCaXIc-L5A0SG1anodolMSJnmQPxSAbYYK-zTbV6jPuwAmr1lxDIGTUGZ_dz8xR-VhIDLeKPwojboJQHozBFmDa2LVlrKKgvzHaHidvPXobx9aTp25XCcRGtRaljyazkBUzs_LhDRbjyMar0o5-M96i8KGE9Y3fzH5gFlUzpS9tjKEqP1AMYDIYqn9dDLX4Ur9mDfRbHJqBbrCA9Fb6lI_4ZLIQlDBwl8OaeTeIqiDIgyZg');
      return request.close();
    }));

    var transformedResponse = await response.transform(utf8.decoder).join();
    return json.decode(transformedResponse);
  }

  Future<dynamic> _(Uri uri) async {
    var response = await (await _http.getUrl(uri)).close();
    var transformedResponse = await response.transform(utf8.decoder).join();
    return json.decode(transformedResponse);
  }

  Future<List<TobaccoMix>> fetchtobacoMix(
      {int page: 0, String category: "popular"}) async {
    var url = Uri.https(baseUrl, '/api/Mixology/GetMixes');

    return _getJson(url)
        .then((json) => json['Mixes'])
        .then((data) => data.map<TobaccoMix>((mix)=> TobaccoMix(mix)).toList());
  }
}
