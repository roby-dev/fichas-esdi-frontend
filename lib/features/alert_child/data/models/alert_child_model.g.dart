// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_child_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlertChildModel _$AlertChildModelFromJson(Map<String, dynamic> json) =>
    AlertChildModel(
      id: json['id'] as String,
      documentNumber: json['documentNumber'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthday: DateTime.parse(json['birthday'] as String),
      admissionDate: DateTime.parse(json['admissionDate'] as String),
      communityHallId: json['communityHallId'] as String,
      managementCommitteeId: json['managementCommitteeId'] as String,
      alerts: (json['alerts'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AlertChildModelToJson(AlertChildModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentNumber': instance.documentNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthday': instance.birthday.toIso8601String(),
      'admissionDate': instance.admissionDate.toIso8601String(),
      'communityHallId': instance.communityHallId,
      'managementCommitteeId': instance.managementCommitteeId,
      'alerts': instance.alerts,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
