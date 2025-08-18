class UserSessionState {
  final String? email;
  final String? committeeName;
  final String? committeeId;
  final List<String> roles;
  final DateTime? loginAtUtc;
  final Map<String, dynamic> extra;

  const UserSessionState({
    this.email,
    this.committeeName,
    this.committeeId,
    this.roles = const [],
    this.loginAtUtc,
    this.extra = const {},
  });

  bool get isLoggedIn => email != null;

  UserSessionState copyWith({
    String? email,
    String? committeeName,
    String? committeeId,
    List<String>? roles,
    DateTime? loginAtUtc,
    Map<String, dynamic>? extra,
  }) {
    return UserSessionState(
      email: email ?? this.email,
      committeeName: committeeName ?? this.committeeName,
      committeeId: email ?? this.committeeId,
      roles: roles ?? this.roles,
      loginAtUtc: loginAtUtc ?? this.loginAtUtc,
      extra: extra ?? this.extra,
    );
  }
}
