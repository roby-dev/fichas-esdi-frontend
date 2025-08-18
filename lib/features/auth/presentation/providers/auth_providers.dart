import 'package:fichas_esdi/core/providers/core_providers.dart';
import 'package:fichas_esdi/core/session/user_session_provider.dart';
import 'package:fichas_esdi/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:fichas_esdi/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fichas_esdi/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fichas_esdi/features/auth/domain/entities/login_request.dart';
import 'package:fichas_esdi/features/auth/domain/entities/login_response.dart';
import 'package:fichas_esdi/features/auth/domain/repositories/auth_repository.dart';
import 'package:fichas_esdi/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  return AuthLocalDataSourceImpl(
    ref.watch(sharedPreferencesProvider),
    ref.watch(userSessionProvider.notifier),
  );
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(ref.watch(apiClientProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider),
  );
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
});

// Estado de autenticación
class AuthState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? errorMessage;
  final LoginResponse? loginResponse;

  const AuthState({
    this.isLoading = false,
    this.isAuthenticated = false,
    this.errorMessage,
    this.loginResponse,
  });

  AuthState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? errorMessage,
    LoginResponse? loginResponse,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      errorMessage: errorMessage,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }
}

// Notifier para manejar el estado de autenticación
class AuthNotifier extends StateNotifier<AuthState> {
  final UserSessionNotifier _userSessionNotifier;
  final LoginUseCase _loginUseCase;
  final AuthRepository _authRepository;

  AuthNotifier(
    this._userSessionNotifier,
    this._loginUseCase,
    this._authRepository,
  ) : super(const AuthState()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final result = await _authRepository.isLoggedIn();
    result.fold(
      (failure) => state = state.copyWith(isAuthenticated: false),
      (isLoggedIn) => state = state.copyWith(isAuthenticated: isLoggedIn),
    );
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final loginRequest = LoginRequest(email: email, password: password);
    final result = await _loginUseCase(loginRequest);

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          isAuthenticated: false,
          errorMessage: failure.message,
        );
      },
      (loginResponse) {
        state = state.copyWith(
          isLoading: false,
          isAuthenticated: true,
          loginResponse: loginResponse,
          errorMessage: null,
        );
      },
    );
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true);

    final result = await _authRepository.logout();
    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
      },
      (_) {
        state = state.copyWith(
          isLoading: false,
          isAuthenticated: false,
          loginResponse: null,
        );
        _userSessionNotifier.clearSession();
      },
    );
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    ref.read(userSessionProvider.notifier),
    ref.watch(loginUseCaseProvider),
    ref.watch(authRepositoryProvider),
  );
});
