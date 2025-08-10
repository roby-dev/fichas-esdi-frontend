class Child {
  final String id;
  final String documentNumber;
  final String firstName;
  final String lastName;
  final DateTime birthday;
  final DateTime admissionDate;
  final String communityHallId;
  final DateTime admissionValidFrom;
  final DateTime admissionValidUntil;
  final DateTime graduationDate;
  final bool isCurrentlyAdmitted;
  final bool isGraduated;

  const Child({
    required this.id,
    required this.documentNumber,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.admissionDate,
    required this.communityHallId,
    required this.admissionValidFrom,
    required this.admissionValidUntil,
    required this.graduationDate,
    required this.isCurrentlyAdmitted,
    required this.isGraduated,
  });
}
