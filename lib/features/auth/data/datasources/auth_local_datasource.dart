import 'package:fichas_esdi/core/constants/app_constants.dart';
import 'package:fichas_esdi/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> saveTokens(String accessToken, String refreshToken);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> clearTokens();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  const AuthLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    try {
      await Future.wait([
        sharedPreferences.setString(AppConstants.accessTokenKey, accessToken),
        sharedPreferences.setString(AppConstants.refreshTokenKey, refreshToken),
      ]);
    } catch (e) {
      throw const CacheException('Failed to save tokens');
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      return sharedPreferences.getString(AppConstants.accessTokenKey);
    } catch (e) {
      throw const CacheException('Failed to get access token');
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      return sharedPreferences.getString(AppConstants.refreshTokenKey);
    } catch (e) {
      throw const CacheException('Failed to get refresh token');
    }
  }

  @override
  Future<void> clearTokens() async {
    try {
      await Future.wait([
        sharedPreferences.remove(AppConstants.accessTokenKey),
        sharedPreferences.remove(AppConstants.refreshTokenKey),
      ]);
    } catch (e) {
      throw const CacheException('Failed to clear tokens');
    }
  }
}
