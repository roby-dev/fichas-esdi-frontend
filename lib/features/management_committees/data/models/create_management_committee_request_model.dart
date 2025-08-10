import 'package:fichas_esdi/features/management_committees/domain/entities/create_management_committee_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_management_committee_request_model.g.dart';

@JsonSerializable()
class CreateManagementCommitteeRequestModel
    extends CreateManagementCommitteeRequest {
  const CreateManagementCommitteeRequestModel({
    required super.committeeId,
    required super.name,
  });

  factory CreateManagementCommitteeRequestModel.fromEntity(
    CreateManagementCommitteeRequest entity,
  ) {
    return CreateManagementCommitteeRequestModel(
      committeeId: entity.committeeId,
      name: entity.name,
    );
  }

  factory CreateManagementCommitteeRequestModel.fromJson(
    Map<String, dynamic> json,
  ) => _$CreateManagementCommitteeRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateManagementCommitteeRequestModelToJson(this);
}
