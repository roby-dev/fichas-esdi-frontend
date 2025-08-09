// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulk_update_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BulkUpdateResponseModel _$BulkUpdateResponseModelFromJson(
  Map<String, dynamic> json,
) => BulkUpdateResponseModel(
  updated: (json['updated'] as num).toInt(),
  created: (json['created'] as num).toInt(),
  errors: (json['errors'] as num).toInt(),
  message: json['message'] as String,
);

Map<String, dynamic> _$BulkUpdateResponseModelToJson(
  BulkUpdateResponseModel instance,
) => <String, dynamic>{
  'updated': instance.updated,
  'created': instance.created,
  'errors': instance.errors,
  'message': instance.message,
};
