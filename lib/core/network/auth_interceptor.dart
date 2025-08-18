import 'package:dio/dio.dart';
import 'package:fichas_esdi/core/constants/app_constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  final SharedPreferences sharedPreferences;
  final Dio _authDio;

  AuthInterceptor(this.sharedPreferences)
    : _authDio = Dio(
        BaseOptions(
          baseUrl:
              dotenv.env['BASE_URL'] ?? 'https://fichas-esdi-backend.fly.dev',
          headers: {'Content-Type': 'application/json'},
        ),
      );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = sharedPreferences.getString(AppConstants.accessTokenKey);

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // solo manejar 401 (expirado)
    if (err.response?.statusCode == 401) {
      final refreshToken = sharedPreferences.getString(
        AppConstants.refreshTokenKey,
      );

      if (refreshToken != null && refreshToken.isNotEmpty) {
        try {
          final response = await _authDio.post(
            '/api/v1/auth/refresh',
            data: {'refreshToken': refreshToken},
          );

          final newAccessToken = response.data['accessToken'];
          final newRefreshToken = response.data['refreshToken'];

          if (newAccessToken != null && newRefreshToken != null) {
            await sharedPreferences.setString(
              AppConstants.accessTokenKey,
              newAccessToken,
            );
            await sharedPreferences.setString(
              AppConstants.refreshTokenKey,
              newRefreshToken,
            );

            final retryRequest = err.requestOptions;
            retryRequest.headers['Authorization'] = 'Bearer $newAccessToken';

            final retryResponse = await Dio().fetch(retryRequest);

            return handler.resolve(retryResponse);
          } else {
            await _clearSession();
          }
        } catch (_) {
          await _clearSession();
        }
      } else {
        await _clearSession();
      }
    }

    // cualquier otro error, dejarlo pasar
    return super.onError(err, handler);
  }

  Future<void> _clearSession() async {
    await sharedPreferences.remove(AppConstants.accessTokenKey);
    await sharedPreferences.remove(AppConstants.refreshTokenKey);
  }
}
