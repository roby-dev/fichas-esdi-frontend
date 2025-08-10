class CommunityHall<T> {
  final String id;
  final String localId;
  final String name;
  final String managementCommitteeId;
  final T managementCommittee;

  const CommunityHall({
    required this.id,
    required this.localId,
    required this.name,
    required this.managementCommitteeId,
    required this.managementCommittee,
  });
}
