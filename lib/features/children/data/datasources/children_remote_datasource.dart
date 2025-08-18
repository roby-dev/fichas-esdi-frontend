import 'package:fichas_esdi/core/network/api_client.dart';
import 'package:fichas_esdi/features/children/data/models/child_model.dart';
import 'package:fichas_esdi/features/children/data/models/create_child_request_model.dart';

abstract class ChildrenRemoteDataSource {
  Future<ChildModel> createChild(CreateChildRequestModel request);
  Future<List<ChildModel>> getChildren();
  Future<ChildModel> getChildById(String id);
}

class ChildrenRemoteDataSourceImpl implements ChildrenRemoteDataSource {
  final ApiClient apiClient;

  const ChildrenRemoteDataSourceImpl(this.apiClient);

  @override
  Future<ChildModel> createChild(CreateChildRequestModel request) async {
    final response = await apiClient.post(
      '/api/v1/children',
      data: request.toJson(),
    );
    return ChildModel.fromJson(response.data);
  }

  @override
  Future<List<ChildModel>> getChildren() async {
    final response = await apiClient.get('/api/v1/children');
    final List<dynamic> data = response.data;
    return data.map((json) => ChildModel.fromJson(json)).toList();
  }

  @override
  Future<ChildModel> getChildById(String id) async {
    final response = await apiClient.get('/api/v1/children/$id');
    return ChildModel.fromJson(response.data);
  }
}
