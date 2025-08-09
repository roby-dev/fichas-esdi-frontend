import 'package:fichas_esdi/core/network/api_client.dart';
import 'package:fichas_esdi/features/auth/data/models/login_request_model.dart';
import 'package:fichas_esdi/features/auth/data/models/login_response_model.dart';
import 'package:fichas_esdi/features/auth/data/models/refresh_token_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel request);
  Future<LoginResponseModel> refreshToken(RefreshTokenRequestModel request);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  const AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    final response = await apiClient.post(
      '/api/v1/auth/login',
      data: request.toJson(),
    );

    return LoginResponseModel.fromJson(response.data);
  }

  @override
  Future<LoginResponseModel> refreshToken(
    RefreshTokenRequestModel request,
  ) async {
    final response = await apiClient.post(
      '/api/v1/auth/refresh',
      data: request.toJson(),
    );
    return LoginResponseModel.fromJson(response.data);
  }
}
