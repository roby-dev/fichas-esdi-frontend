import 'package:fichas_esdi/features/alert_child/data/models/alert_child_model.dart';
import 'package:fichas_esdi/features/alert_child/domain/entities/bulk_update_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bulk_update_response_model.g.dart';

@JsonSerializable()
class BulkUpdateResponseModel extends BulkUpdateResponse {
  const BulkUpdateResponseModel({
    required super.ok,
    required super.message,
    required List<AlertChildModel> super.data,
  });

  factory BulkUpdateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BulkUpdateResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BulkUpdateResponseModelToJson(this);
}
