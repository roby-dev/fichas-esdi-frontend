import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fichas_esdi/core/network/api_client.dart';
import 'package:fichas_esdi/features/alert_child/data/models/alert_child_model.dart';
import 'package:fichas_esdi/features/alert_child/data/models/bulk_update_response_model.dart';

abstract class AlertChildRemoteDataSource {
  Future<BulkUpdateResponseModel> bulkUpdateChildren(
    File file,
    String committeeId,
  );
  Future<List<AlertChildModel>> getAlertChildren();
  Future<List<AlertChildModel>> getAlertChildrenByCommitteeId(
    String committeeId,
  );
}

class AlertChildRemoteDataSourceImpl implements AlertChildRemoteDataSource {
  final ApiClient apiClient;

  const AlertChildRemoteDataSourceImpl(this.apiClient);

  @override
  Future<BulkUpdateResponseModel> bulkUpdateChildren(
    File file,
    String committeeId,
  ) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      ),
      'committeeId': committeeId,
    });

    final response = await apiClient.post(
      '/api/v1/alert-child/bulk-update',
      data: formData,
      options: Options(headers: {'Content-Type': 'multipart/form-data'}),
    );

    return BulkUpdateResponseModel.fromJson(response.data);
  }

  @override
  Future<List<AlertChildModel>> getAlertChildren() async {
    final response = await apiClient.get('/api/v1/alert-child');
    final List<dynamic> data = response.data;
    return data.map((json) => AlertChildModel.fromJson(json)).toList();
  }

  @override
  Future<List<AlertChildModel>> getAlertChildrenByCommitteeId(
    String committeeId,
  ) async {
    final response = await apiClient.get(
      '/api/v1/alert-child/by-committee/$committeeId',
    );
    final List<dynamic> data = response.data;
    return data.map((json) => AlertChildModel.fromJson(json)).toList();
  }
}
