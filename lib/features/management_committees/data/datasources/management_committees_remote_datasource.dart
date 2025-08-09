import 'package:fichas_esdi/core/network/api_client.dart';
import 'package:fichas_esdi/features/management_committees/data/models/create_management_committee_request_model.dart';
import 'package:fichas_esdi/features/management_committees/data/models/management_committee_model.dart';

abstract class ManagementCommitteesRemoteDataSource {
  Future<ManagementCommitteeModel> createManagementCommittee(
    CreateManagementCommitteeRequestModel request,
  );
  Future<List<ManagementCommitteeModel>> getManagementCommittees();
  Future<ManagementCommitteeModel> getManagementCommitteeById(String id);
}

class ManagementCommitteesRemoteDataSourceImpl
    implements ManagementCommitteesRemoteDataSource {
  final ApiClient apiClient;

  const ManagementCommitteesRemoteDataSourceImpl(this.apiClient);

  @override
  Future<ManagementCommitteeModel> createManagementCommittee(
    CreateManagementCommitteeRequestModel request,
  ) async {
    final response = await apiClient.post(
      '/api/v1/management-committees',
      data: request.toJson(),
    );
    return ManagementCommitteeModel.fromJson(response.data);
  }

  @override
  Future<List<ManagementCommitteeModel>> getManagementCommittees() async {
    final response = await apiClient.get('/api/v1/management-committees');
    final List<dynamic> data = response.data;
    return data.map((json) => ManagementCommitteeModel.fromJson(json)).toList();
  }

  @override
  Future<ManagementCommitteeModel> getManagementCommitteeById(String id) async {
    final response = await apiClient.get('/api/v1/management-committees/$id');
    return ManagementCommitteeModel.fromJson(response.data);
  }
}
