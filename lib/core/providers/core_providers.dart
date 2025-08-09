// Provider para SharedPreferences
import 'package:fichas_esdi/core/network/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

// Provider para ApiClient que depende de SharedPreferences
final apiClientProvider = Provider<ApiClient>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return ApiClient(sharedPreferences);
});
