import 'package:json_annotation/json_annotation.dart';

part 'management_committee_model.g.dart';

@JsonSerializable()
class ManagementCommitteeModel {
  final String id;
  final String committeeId;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ManagementCommitteeModel({
    required this.id,
    required this.committeeId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ManagementCommitteeModel.fromJson(Map<String, dynamic> json) =>
      _$ManagementCommitteeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManagementCommitteeModelToJson(this);
}
