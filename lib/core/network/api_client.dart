import 'package:dio/dio.dart';
import 'package:fichas_esdi/core/errors/exceptions.dart';
import 'package:fichas_esdi/core/network/auth_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient(SharedPreferences sharedPreferences) {
    final baseUrl =
        dotenv.env['BASE_URL'] ?? 'https://fichas-esdi-backend.fly.dev';

    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 120),
        receiveTimeout: const Duration(seconds: 120),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );

    // Ahora sí podemos usar sharedPreferences
    _dio.interceptors.add(AuthInterceptor(sharedPreferences));
  }

  // Método para agregar token de autenticación
  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  // Método para remover token
  void removeAuthToken() {
    _dio.options.headers.remove('Authorization');
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  AppException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const NetworkException('Connection timeout');
      case DioExceptionType.connectionError:
        return const NetworkException('No internet connection');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data['message'] ?? 'Server error';

        if (statusCode == 401) {
          return const ServerException('Unauthorized - Please login again');
        } else if (statusCode == 403) {
          return const ServerException('Forbidden - Access denied');
        } else if (statusCode == 404) {
          return const ServerException('Resource not found');
        }

        return ServerException(message);
      default:
        return const ServerException('Unexpected error occurred');
    }
  }
}
