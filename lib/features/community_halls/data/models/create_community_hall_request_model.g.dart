// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_community_hall_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCommunityHallRequestModel _$CreateCommunityHallRequestModelFromJson(
  Map<String, dynamic> json,
) => CreateCommunityHallRequestModel(
  localId: json['localId'] as String,
  name: json['name'] as String,
  managementCommitteeId: json['managementCommitteeId'] as String,
);

Map<String, dynamic> _$CreateCommunityHallRequestModelToJson(
  CreateCommunityHallRequestModel instance,
) => <String, dynamic>{
  'localId': instance.localId,
  'name': instance.name,
  'managementCommitteeId': instance.managementCommitteeId,
};
