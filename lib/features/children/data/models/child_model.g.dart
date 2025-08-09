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
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
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
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
