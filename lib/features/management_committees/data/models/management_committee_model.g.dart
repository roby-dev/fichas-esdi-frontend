// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management_committee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManagementCommitteeModel _$ManagementCommitteeModelFromJson(
  Map<String, dynamic> json,
) => ManagementCommitteeModel(
  id: json['id'] as String,
  committeeId: json['committeeId'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$ManagementCommitteeModelToJson(
  ManagementCommitteeModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'committeeId': instance.committeeId,
  'name': instance.name,
};
