// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChildModel _$ChildModelFromJson(Map<String, dynamic> json) => ChildModel(
  id: json['id'] as String,
  documentNumber: json['documentNumber'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  birthday: DateTime.parse(json['birthday'] as String),
  admissionDate: DateTime.parse(json['admissionDate'] as String),
  communityHallId: json['communityHallId'] as String,
  admissionValidFrom: DateTime.parse(json['admissionValidFrom'] as String),
  admissionValidUntil: DateTime.parse(json['admissionValidUntil'] as String),
  graduationDate: DateTime.parse(json['graduationDate'] as String),
  isCurrentlyAdmitted: json['isCurrentlyAdmitted'] as bool,
  isGraduated: json['isGraduated'] as bool,
);

Map<String, dynamic> _$ChildModelToJson(ChildModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentNumber': instance.documentNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthday': instance.birthday.toIso8601String(),
      'admissionDate': instance.admissionDate.toIso8601String(),
      'communityHallId': instance.communityHallId,
      'admissionValidFrom': instance.admissionValidFrom.toIso8601String(),
      'admissionValidUntil': instance.admissionValidUntil.toIso8601String(),
      'graduationDate': instance.graduationDate.toIso8601String(),
      'isCurrentlyAdmitted': instance.isCurrentlyAdmitted,
      'isGraduated': instance.isGraduated,
    };
