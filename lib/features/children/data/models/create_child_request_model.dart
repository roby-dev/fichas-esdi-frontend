import 'package:fichas_esdi/features/children/domain/entities/create_child_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_child_request_model.g.dart';

@JsonSerializable()
class CreateChildRequestModel extends CreateChildRequest {
  const CreateChildRequestModel({
    required super.documentNumber,
    required super.firstName,
    required super.lastName,
    required super.birthday,
    required super.admissionDate,
    required super.communityHallId,
  });

  factory CreateChildRequestModel.fromEntity(CreateChildRequest entity) {
    return CreateChildRequestModel(
      documentNumber: entity.documentNumber,
      firstName: entity.firstName,
      lastName: entity.lastName,
      birthday: entity.birthday,
      admissionDate: entity.admissionDate,
      communityHallId: entity.communityHallId,
    );
  }

  factory CreateChildRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateChildRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateChildRequestModelToJson(this);
}
