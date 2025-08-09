import 'package:json_annotation/json_annotation.dart';

part 'bulk_update_response_model.g.dart';

@JsonSerializable()
class BulkUpdateResponseModel {
  final int updated;
  final int created;
  final int errors;
  final String message;

  const BulkUpdateResponseModel({
    required this.updated,
    required this.created,
    required this.errors,
    required this.message,
  });

  factory BulkUpdateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BulkUpdateResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BulkUpdateResponseModelToJson(this);
}
