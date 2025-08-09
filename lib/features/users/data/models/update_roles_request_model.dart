import 'package:json_annotation/json_annotation.dart';

part 'update_roles_request_model.g.dart';

@JsonSerializable()
class UpdateRolesRequestModel {
  final String userId;
  final List<String> roles;

  const UpdateRolesRequestModel({required this.userId, required this.roles});

  factory UpdateRolesRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateRolesRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateRolesRequestModelToJson(this);
}
