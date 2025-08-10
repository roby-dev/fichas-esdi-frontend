import 'package:fichas_esdi/features/auth/domain/entities/refresh_token_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_request_model.g.dart';

@JsonSerializable()
class RefreshTokenRequestModel extends RefreshTokenRequest {
  const RefreshTokenRequestModel({required super.refreshToken});

  factory RefreshTokenRequestModel.fromEntity(RefreshTokenRequest entity) {
    return RefreshTokenRequestModel(refreshToken: entity.refreshToken);
  }

  factory RefreshTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenRequestModelToJson(this);
}
