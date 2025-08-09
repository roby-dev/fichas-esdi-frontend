// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_management_committee_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateManagementCommitteeRequestModel
_$CreateManagementCommitteeRequestModelFromJson(Map<String, dynamic> json) =>
    CreateManagementCommitteeRequestModel(
      committeeId: json['committeeId'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CreateManagementCommitteeRequestModelToJson(
  CreateManagementCommitteeRequestModel instance,
) => <String, dynamic>{
  'committeeId': instance.committeeId,
  'name': instance.name,
};
