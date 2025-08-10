class CreateChildRequest {
  final String documentNumber;
  final String firstName;
  final String lastName;
  final String birthday; // YYYY-MM-DD format
  final String admissionDate; // YYYY-MM-DD format
  final String communityHallId;

  const CreateChildRequest({
    required this.documentNumber,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.admissionDate,
    required this.communityHallId,
  });
}
