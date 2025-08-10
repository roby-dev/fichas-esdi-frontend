// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_child_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlertChildModel _$AlertChildModelFromJson(Map<String, dynamic> json) =>
    AlertChildModel(
      id: json['id'] as String,
      documentNumber: json['documentNumber'] as String,
      fullName: json['fullName'] as String,
      gender: json['gender'] as String,
      childCode: json['childCode'] as String,
      admissionDate: DateTime.parse(json['admissionDate'] as String),
      birthday: DateTime.parse(json['birthday'] as String),
      managementCommitteName: json['managementCommitteName'] as String,
      communityHallName: json['communityHallName'] as String,
      managementCommitteCode: json['managementCommitteCode'] as String,
      communityHallId: json['communityHallId'] as String,
      ageInMonths: (json['ageInMonths'] as num).toInt(),
      activeAlertSignal: json['activeAlertSignal'] as String,
      alertSignalSchedule: json['alertSignalSchedule'] as String,
    );

Map<String, dynamic> _$AlertChildModelToJson(AlertChildModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentNumber': instance.documentNumber,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'childCode': instance.childCode,
      'admissionDate': instance.admissionDate.toIso8601String(),
      'birthday': instance.birthday.toIso8601String(),
      'managementCommitteName': instance.managementCommitteName,
      'communityHallName': instance.communityHallName,
      'managementCommitteCode': instance.managementCommitteCode,
      'communityHallId': instance.communityHallId,
      'ageInMonths': instance.ageInMonths,
      'activeAlertSignal': instance.activeAlertSignal,
      'alertSignalSchedule': instance.alertSignalSchedule,
    };
