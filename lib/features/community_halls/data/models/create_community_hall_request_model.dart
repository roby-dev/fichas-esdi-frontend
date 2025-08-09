import 'package:json_annotation/json_annotation.dart';

part 'create_community_hall_request_model.g.dart';

@JsonSerializable()
class CreateCommunityHallRequestModel {
  final String localId;
  final String name;
  final String managementCommitteeId;

  const CreateCommunityHallRequestModel({
    required this.localId,
    required this.name,
    required this.managementCommitteeId,
  });

  factory CreateCommunityHallRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCommunityHallRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateCommunityHallRequestModelToJson(this);
}
