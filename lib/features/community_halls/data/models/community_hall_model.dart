import 'package:json_annotation/json_annotation.dart';

part 'community_hall_model.g.dart';

@JsonSerializable()
class CommunityHallModel {
  final String id;
  final String localId;
  final String name;
  final String managementCommitteeId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CommunityHallModel({
    required this.id,
    required this.localId,
    required this.name,
    required this.managementCommitteeId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CommunityHallModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityHallModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityHallModelToJson(this);
}
