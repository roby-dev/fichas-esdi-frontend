import 'package:fichas_esdi/features/children/domain/entities/child.dart';
import 'package:json_annotation/json_annotation.dart';

part 'child_model.g.dart';

@JsonSerializable()
class ChildModel extends Child {
  const ChildModel({
    required super.id,
    required super.documentNumber,
    required super.firstName,
    required super.lastName,
    required super.birthday,
    required super.admissionDate,
    required super.communityHallId,
    required super.admissionValidFrom,
    required super.admissionValidUntil,
    required super.graduationDate,
    required super.isCurrentlyAdmitted,
    required super.isGraduated,
  });

  factory ChildModel.fromJson(Map<String, dynamic> json) =>
      _$ChildModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChildModelToJson(this);
}
