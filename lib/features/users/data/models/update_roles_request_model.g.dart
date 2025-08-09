// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_roles_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRolesRequestModel _$UpdateRolesRequestModelFromJson(
  Map<String, dynamic> json,
) => UpdateRolesRequestModel(
  userId: json['userId'] as String,
  roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$UpdateRolesRequestModelToJson(
  UpdateRolesRequestModel instance,
) => <String, dynamic>{'userId': instance.userId, 'roles': instance.roles};
