// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserRequestModel _$CreateUserRequestModelFromJson(
  Map<String, dynamic> json,
) => CreateUserRequestModel(
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$CreateUserRequestModelToJson(
  CreateUserRequestModel instance,
) => <String, dynamic>{'email': instance.email, 'password': instance.password};
