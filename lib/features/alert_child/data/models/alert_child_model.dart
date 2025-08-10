import 'package:fichas_esdi/features/alert_child/domain/entities/alert_child.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alert_child_model.g.dart';

@JsonSerializable()
class AlertChildModel extends AlertChild {
  const AlertChildModel({
    required super.id,
    required super.documentNumber,
    required super.fullName,
    required super.gender,
    required super.childCode,
    required super.admissionDate,
    required super.birthday,
    required super.managementCommitteName,
    required super.communityHallName,
    required super.managementCommitteCode,
    required super.communityHallId,
    required super.ageInMonths,
    required super.activeAlertSignal,
    required super.alertSignalSchedule,
  });

  factory AlertChildModel.fromJson(Map<String, dynamic> json) =>
      _$AlertChildModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlertChildModelToJson(this);
}
