import 'package:json_annotation/json_annotation.dart';

part 'create_management_committee_request_model.g.dart';

@JsonSerializable()
class CreateManagementCommitteeRequestModel {
  final String committeeId;
  final String name;

  const CreateManagementCommitteeRequestModel({
    required this.committeeId,
    required this.name,
  });

  factory CreateManagementCommitteeRequestModel.fromJson(
    Map<String, dynamic> json,
  ) => _$CreateManagementCommitteeRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateManagementCommitteeRequestModelToJson(this);
}
