import 'package:fichas_esdi/features/community_halls/domain/entities/create_community_hall_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_community_hall_request_model.g.dart';

@JsonSerializable()
class CreateCommunityHallRequestModel extends CreateCommunityHallRequest {
  const CreateCommunityHallRequestModel({
    required super.localId,
    required super.name,
    required super.managementCommitteeId,
  });

  factory CreateCommunityHallRequestModel.fromEntity(
    CreateCommunityHallRequest entity,
  ) {
    return CreateCommunityHallRequestModel(
      localId: entity.localId,
      name: entity.name,
      managementCommitteeId: entity.managementCommitteeId,
    );
  }

  factory CreateCommunityHallRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCommunityHallRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateCommunityHallRequestModelToJson(this);
}
