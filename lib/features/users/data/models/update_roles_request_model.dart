import 'package:fichas_esdi/features/users/domain/entities/update_roles_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_roles_request_model.g.dart';

@JsonSerializable()
class UpdateRolesRequestModel extends UpdateRolesRequest {
  const UpdateRolesRequestModel({required super.userId, required super.roles});

  factory UpdateRolesRequestModel.fromEntity(UpdateRolesRequest entity) {
    return UpdateRolesRequestModel(userId: entity.userId, roles: entity.roles);
  }

  factory UpdateRolesRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateRolesRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateRolesRequestModelToJson(this);
}
