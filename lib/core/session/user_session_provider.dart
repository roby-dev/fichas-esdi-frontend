import 'package:fichas_esdi/core/constants/app_constants.dart';
import 'package:fichas_esdi/core/providers/core_providers.dart';
import 'package:fichas_esdi/core/session/user_session_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSessionNotifier extends StateNotifier<UserSessionState> {
  final SharedPreferences sharedPreferences;

  UserSessionNotifier(this.sharedPreferences)
    : super(const UserSessionState()) {
    final accessToken = sharedPreferences.getString(
      AppConstants.accessTokenKey,
    );

    if (accessToken != null && accessToken.isNotEmpty) {
      setSession(accessToken);
    }

    final committeeName = sharedPreferences.getString(
      AppConstants.committeeNameKey,
    );
    final committeeId = sharedPreferences.getString(AppConstants.committeeKey);
    if (committeeId != null &&
        committeeId.isNotEmpty &&
        committeeName != null &&
        committeeName.isNotEmpty) {
      setCommittee(committeeId, committeeName);
    }
  }

  void setCommittee(String committeeId, String committeeName) {
    state = state.copyWith(
      committeeId: committeeId,
      committeeName: committeeName,
    );
  }

  void setSession(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    state = UserSessionState(
      email: decodedToken["email"],
      roles:
          (decodedToken["roles"] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      loginAtUtc: DateTime.now().toUtc(),
      extra: decodedToken, // si quieres guardar todo el payload
    );
  }

  void clearSession() {
    state = const UserSessionState();
  }
}

final userSessionProvider =
    StateNotifierProvider<UserSessionNotifier, UserSessionState>((ref) {
      return UserSessionNotifier(ref.watch(sharedPreferencesProvider));
    });
