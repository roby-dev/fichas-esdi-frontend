class AlertChild {
  final String id;
  final String documentNumber;
  final String fullName;
  final String gender;
  final String childCode;
  final DateTime admissionDate;
  final DateTime birthday;
  final String managementCommitteName;
  final String communityHallName;
  final String managementCommitteCode;
  final String communityHallId;
  final int ageInMonths;
  final String activeAlertSignal;
  final String alertSignalSchedule;

  const AlertChild({
    required this.id,
    required this.documentNumber,
    required this.fullName,
    required this.gender,
    required this.childCode,
    required this.admissionDate,
    required this.birthday,
    required this.managementCommitteName,
    required this.communityHallName,
    required this.managementCommitteCode,
    required this.communityHallId,
    required this.ageInMonths,
    required this.activeAlertSignal,
    required this.alertSignalSchedule,
  });
}
