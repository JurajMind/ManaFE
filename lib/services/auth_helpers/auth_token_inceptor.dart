import 'package:app/main.dart';
import 'package:dio/dio.dart';

import '../authorization.dart';

class AuthTokenInceptor extends Interceptor {
  final AuthorizeRepository _authorize = getIt.get<AuthorizeRepository>();
  final Dio _dio;

  AuthTokenInceptor(this._dio);

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401 ||
        error.response?.statusCode == 403) {
      var token = _authorize.getToken();
      var tokenHeader = 'Bearer $token';
      RequestOptions options = error?.response?.requestOptions;
      // If the token has been updated, repeat directly.
      if (token != null || options == null)
        return await _handleAuthError(tokenHeader, options, token);
      else {
        print('Null token');
      }
    } else {
      print(error.message);
      print(error.response);
      print(error?.response?.requestOptions?.path);
    }
  }

  _handleAuthError(
      String tokenHeader, RequestOptions options, String token) async {
    if (tokenHeader != options.headers["Authorization"]) {
      options.headers["Authorization"] = tokenHeader;
      //repeat
      return _dio.request(
        options.path,
        options: Options(
            contentType: options.contentType,
            extra: options.extra,
            followRedirects: options.followRedirects,
            headers: options.headers),
      );
    }
    _dio.lock();
    _dio.interceptors.responseLock.lock();
    _dio.interceptors.errorLock.lock();

    var refreshToken = await _authorize.refreshToken();
    options.headers["Authorization"] = 'Bearer $refreshToken';
    _dio.unlock();
    _dio.interceptors.responseLock.unlock();
    _dio.interceptors.errorLock.unlock();

    return _dio.request(
      options.path,
      options: Options(
          contentType: options.contentType,
          extra: options.extra,
          followRedirects: options.followRedirects,
          headers: options.headers),
    );
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var token = _authorize.getToken();
    options.headers['Authorization'] = 'Bearer $token';
    options.headers["Accept"] = "application/json";
    options.headers['content-type'] = 'application/json';
    print(options.uri.toString());
    super.onRequest(options, handler);
  }
}
