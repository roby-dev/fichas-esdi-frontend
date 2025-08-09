import 'package:dio/dio.dart';
import 'package:fichas_esdi/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  final SharedPreferences sharedPreferences;

  AuthInterceptor(this.sharedPreferences);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = sharedPreferences.getString(AppConstants.accessTokenKey);

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Token expirado, limpiar tokens locales
      sharedPreferences.remove(AppConstants.accessTokenKey);
      sharedPreferences.remove(AppConstants.refreshTokenKey);
    }

    super.onError(err, handler);
  }
}
