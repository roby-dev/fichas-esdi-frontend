import 'package:fichas_esdi/features/auth/domain/entities/login_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends LoginResponse {
  const LoginResponseModel({
    required super.accessToken,
    required super.refreshToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
