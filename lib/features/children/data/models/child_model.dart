import 'package:json_annotation/json_annotation.dart';

part 'child_model.g.dart';

@JsonSerializable()
class ChildModel {
  final String id;
  final String documentNumber;
  final String firstName;
  final String lastName;
  final DateTime birthday;
  final DateTime admissionDate;
  final String communityHallId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ChildModel({
    required this.id,
    required this.documentNumber,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.admissionDate,
    required this.communityHallId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChildModel.fromJson(Map<String, dynamic> json) =>
      _$ChildModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChildModelToJson(this);
}
