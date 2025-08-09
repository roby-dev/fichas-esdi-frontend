import 'package:json_annotation/json_annotation.dart';

part 'create_child_request_model.g.dart';

@JsonSerializable()
class CreateChildRequestModel {
  final String documentNumber;
  final String firstName;
  final String lastName;
  final String birthday; // YYYY-MM-DD format
  final String admissionDate; // YYYY-MM-DD format
  final String communityHallId;

  const CreateChildRequestModel({
    required this.documentNumber,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.admissionDate,
    required this.communityHallId,
  });

  factory CreateChildRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateChildRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateChildRequestModelToJson(this);
}
