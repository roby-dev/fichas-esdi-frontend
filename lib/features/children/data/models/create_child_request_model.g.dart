// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_child_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateChildRequestModel _$CreateChildRequestModelFromJson(
  Map<String, dynamic> json,
) => CreateChildRequestModel(
  documentNumber: json['documentNumber'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  birthday: json['birthday'] as String,
  admissionDate: json['admissionDate'] as String,
  communityHallId: json['communityHallId'] as String,
);

Map<String, dynamic> _$CreateChildRequestModelToJson(
  CreateChildRequestModel instance,
) => <String, dynamic>{
  'documentNumber': instance.documentNumber,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'birthday': instance.birthday,
  'admissionDate': instance.admissionDate,
  'communityHallId': instance.communityHallId,
};
