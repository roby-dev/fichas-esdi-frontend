import 'package:fichas_esdi/features/management_committees/domain/entities/management_committee.dart';
import 'package:json_annotation/json_annotation.dart';

part 'management_committee_model.g.dart';

@JsonSerializable()
class ManagementCommitteeModel extends ManagementCommittee {
  const ManagementCommitteeModel({
    required super.id,
    required super.committeeId,
    required super.name,
  });

  factory ManagementCommitteeModel.fromJson(Map<String, dynamic> json) =>
      _$ManagementCommitteeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManagementCommitteeModelToJson(this);
}
