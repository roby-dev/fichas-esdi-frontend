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
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CommunityHallModelToJson(CommunityHallModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'localId': instance.localId,
      'name': instance.name,
      'managementCommitteeId': instance.managementCommitteeId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
