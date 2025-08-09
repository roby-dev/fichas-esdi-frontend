import 'package:json_annotation/json_annotation.dart';

part 'alert_child_model.g.dart';

@JsonSerializable()
class AlertChildModel {
  final String id;
  final String documentNumber;
  final String firstName;
  final String lastName;
  final DateTime birthday;
  final DateTime admissionDate;
  final String communityHallId;
  final String managementCommitteeId;
  final List<String> alerts;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AlertChildModel({
    required this.id,
    required this.documentNumber,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.admissionDate,
    required this.communityHallId,
    required this.managementCommitteeId,
    required this.alerts,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AlertChildModel.fromJson(Map<String, dynamic> json) =>
      _$AlertChildModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlertChildModelToJson(this);
}
