class UpdateRolesRequest {
  final String userId;
  final List<String> roles;

  const UpdateRolesRequest({required this.userId, required this.roles});
}
