import 'package:fichas_esdi/core/network/api_client.dart';
import 'package:fichas_esdi/features/community_halls/data/models/community_hall_model.dart';
import 'package:fichas_esdi/features/community_halls/data/models/create_community_hall_request_model.dart';

abstract class CommunityHallsRemoteDataSource {
  Future<CommunityHallModel> createCommunityHall(
    CreateCommunityHallRequestModel request,
  );
  Future<List<CommunityHallModel>> getCommunityHalls();
  Future<CommunityHallModel> getCommunityHallById(String id);
  Future<List<CommunityHallModel>> getCommunityHallsByCommitteeId(
    String committeeId,
  );
}

class CommunityHallsRemoteDataSourceImpl
    implements CommunityHallsRemoteDataSource {
  final ApiClient apiClient;

  const CommunityHallsRemoteDataSourceImpl(this.apiClient);

  @override
  Future<CommunityHallModel> createCommunityHall(
    CreateCommunityHallRequestModel request,
  ) async {
    final response = await apiClient.post(
      '/api/v1/community-halls',
      data: request.toJson(),
    );
    return CommunityHallModel.fromJson(response.data);
  }

  @override
  Future<List<CommunityHallModel>> getCommunityHalls() async {
    final response = await apiClient.get('/api/v1/community-halls');
    final List<dynamic> data = response.data;
    return data.map((json) => CommunityHallModel.fromJson(json)).toList();
  }

  @override
  Future<CommunityHallModel> getCommunityHallById(String id) async {
    final response = await apiClient.get('/api/v1/community-halls/$id');
    return CommunityHallModel.fromJson(response.data);
  }

  @override
  Future<List<CommunityHallModel>> getCommunityHallsByCommitteeId(
    String committeeId,
  ) async {
    final response = await apiClient.get(
      '/api/v1/community-halls/by-committee/$committeeId',
    );
    final List<dynamic> data = response.data;
    return data.map((json) => CommunityHallModel.fromJson(json)).toList();
  }
}
