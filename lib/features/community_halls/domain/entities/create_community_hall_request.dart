class CreateCommunityHallRequest {
  final String localId;
  final String name;
  final String managementCommitteeId;

  const CreateCommunityHallRequest({
    required this.localId,
    required this.name,
    required this.managementCommitteeId,
  });
}
