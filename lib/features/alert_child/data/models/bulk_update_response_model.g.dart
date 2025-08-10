// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulk_update_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BulkUpdateResponseModel _$BulkUpdateResponseModelFromJson(
  Map<String, dynamic> json,
) => BulkUpdateResponseModel(
  ok: json['ok'] as bool,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => AlertChildModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BulkUpdateResponseModelToJson(
  BulkUpdateResponseModel instance,
) => <String, dynamic>{
  'ok': instance.ok,
  'message': instance.message,
  'data': instance.data,
};
