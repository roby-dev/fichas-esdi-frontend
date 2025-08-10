import 'package:fichas_esdi/features/community_halls/domain/entities/community_hall.dart';
import 'package:fichas_esdi/features/management_committees/data/models/management_committee_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'community_hall_model.g.dart';

@JsonSerializable()
class CommunityHallModel extends CommunityHall {
  const CommunityHallModel({
    required super.id,
    required super.localId,
    required super.name,
    required super.managementCommitteeId,
    required ManagementCommitteeModel super.managementCommittee,
  });

  factory CommunityHallModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityHallModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityHallModelToJson(this);
}
