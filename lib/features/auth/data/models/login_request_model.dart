import 'package:fichas_esdi/features/auth/domain/entities/login_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel extends LoginRequest {
  const LoginRequestModel({required super.email, required super.password});

  factory LoginRequestModel.fromEntity(LoginRequest entity) {
    return LoginRequestModel(email: entity.email, password: entity.password);
  }

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
