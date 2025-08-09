import 'package:fichas_esdi/core/network/api_client.dart';
import 'package:fichas_esdi/features/users/data/models/create_user_request_model.dart';
import 'package:fichas_esdi/features/users/data/models/update_roles_request_model.dart';
import 'package:fichas_esdi/features/users/data/models/user_model.dart';

abstract class UsersRemoteDataSource {
  Future<UserModel> createUser(CreateUserRequestModel request);
  Future<List<UserModel>> getUsers();
  Future<UserModel> getUserById(String id);
  Future<UserModel> updateUserRoles(
    String userId,
    UpdateRolesRequestModel request,
  );
}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  final ApiClient apiClient;

  const UsersRemoteDataSourceImpl(this.apiClient);

  @override
  Future<UserModel> createUser(CreateUserRequestModel request) async {
    final response = await apiClient.post(
      '/api/v1/users',
      data: request.toJson(),
    );
    return UserModel.fromJson(response.data);
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await apiClient.get('/api/v1/users');
    final List<dynamic> data = response.data;
    return data.map((json) => UserModel.fromJson(json)).toList();
  }

  @override
  Future<UserModel> getUserById(String id) async {
    final response = await apiClient.get('/api/v1/users/$id');
    return UserModel.fromJson(response.data);
  }

  @override
  Future<UserModel> updateUserRoles(
    String userId,
    UpdateRolesRequestModel request,
  ) async {
    final response = await apiClient.patch(
      '/api/v1/users/$userId/roles',
      data: request.toJson(),
    );
    return UserModel.fromJson(response.data);
  }
}
