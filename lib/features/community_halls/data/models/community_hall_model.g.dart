// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_hall_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityHallModel _$CommunityHallModelFromJson(Map<String, dynamic> json) =>
    CommunityHallModel(
      id: json['id'] as String,
      localId: json['localId'] as String,
      name: json['name'] as String,
      managementCommitteeId: json['managementCommitteeId'] as String,
      managementCommittee: ManagementCommitteeModel.fromJson(
        json['managementCommittee'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CommunityHallModelToJson(CommunityHallModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'localId': instance.localId,
      'name': instance.name,
      'managementCommitteeId': instance.managementCommitteeId,
      'managementCommittee': instance.managementCommittee,
    };
