import 'package:json_annotation/json_annotation.dart';

part 'create_user_request_model.g.dart';

@JsonSerializable()
class CreateUserRequestModel {
  final String email;
  final String password;

  const CreateUserRequestModel({required this.email, required this.password});

  factory CreateUserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserRequestModelToJson(this);
}
