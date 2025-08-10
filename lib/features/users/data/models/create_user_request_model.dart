import 'package:fichas_esdi/features/users/domain/entities/create_user_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_user_request_model.g.dart';

@JsonSerializable()
class CreateUserRequestModel extends CreateUserRequest {
  const CreateUserRequestModel({required super.email, required super.password});

  factory CreateUserRequestModel.fromEntity(CreateUserRequest entity) {
    return CreateUserRequestModel(
      email: entity.email,
      password: entity.password,
    );
  }

  factory CreateUserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserRequestModelToJson(this);
}
