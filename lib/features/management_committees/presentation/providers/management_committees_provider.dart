import 'package:fichas_esdi/core/constants/app_constants.dart';
import 'package:fichas_esdi/core/providers/core_providers.dart';
import 'package:fichas_esdi/core/session/user_session_provider.dart';
import 'package:fichas_esdi/features/management_committees/data/datasources/management_committees_remote_datasource.dart';
import 'package:fichas_esdi/features/management_committees/data/repositories/management_committees_repository_impl.dart';
import 'package:fichas_esdi/features/management_committees/domain/entities/create_management_committee_request.dart';
import 'package:fichas_esdi/features/management_committees/domain/entities/management_committee.dart';
import 'package:fichas_esdi/features/management_committees/domain/repositories/management_committees_repository.dart';
import 'package:fichas_esdi/features/management_committees/domain/usecases/create_committee_usecase.dart';
import 'package:fichas_esdi/features/management_committees/domain/usecases/get_all_committees_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final committeesRemoteDataSourceProvider =
    Provider<ManagementCommitteesRemoteDataSource>(
      (ref) => ManagementCommitteesRemoteDataSourceImpl(
        ref.watch(apiClientProvider),
      ),
    );

final committeesRepositoryProvider = Provider<ManagementCommitteesRepository>(
  (ref) => ManagementCommitteesRepositoryImpl(
    remoteDataSource: ref.watch(committeesRemoteDataSourceProvider),
  ),
);

final getAllCommitteesUseCaseProvider = Provider<GetAllCommitteesUsecase>(
  (ref) => GetAllCommitteesUsecase(ref.watch(committeesRepositoryProvider)),
);

final createCommitteeUseCaseProvider = Provider<CreateCommitteeUsecase>(
  (ref) => CreateCommitteeUsecase(ref.watch(committeesRepositoryProvider)),
);

class CommitteesState {
  final bool isLoading;
  final List<ManagementCommittee> committeeResponse;
  final String? errorMessage;
  final ManagementCommittee? selectedCommittee;

  const CommitteesState({
    this.isLoading = false,
    this.committeeResponse = const [],
    this.errorMessage,
    this.selectedCommittee,
  });

  CommitteesState copyWith({
    bool? isLoading,
    List<ManagementCommittee>? committeeResponse,
    String? errorMessage,
    ManagementCommittee? selectedCommittee,
  }) {
    return CommitteesState(
      isLoading: isLoading ?? this.isLoading,
      committeeResponse: committeeResponse ?? this.committeeResponse,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedCommittee: selectedCommittee ?? this.selectedCommittee,
    );
  }
}

class CommitteesNotifier extends StateNotifier<CommitteesState> {
  final GetAllCommitteesUsecase _getAllCommitteesUsecase;
  final CreateCommitteeUsecase _createCommitteeUsecase;
  final SharedPreferences _sharedPreferences;
  final UserSessionNotifier _userSessionNotifier;

  CommitteesNotifier(
    this._getAllCommitteesUsecase,
    this._createCommitteeUsecase,
    this._sharedPreferences,
    this._userSessionNotifier,
  ) : super(const CommitteesState());

  Future<void> getCommittees() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final result = await _getAllCommitteesUsecase();
    result.fold(
      (error) =>
          state = state.copyWith(isLoading: false, errorMessage: error.message),
      (committees) => state = state.copyWith(
        isLoading: false,
        committeeResponse: committees,
      ),
    );
  }

  Future<void> createCommittee(ManagementCommittee committee) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final manageCommitteeRequest = CreateManagementCommitteeRequest(
      committeeId: committee.id,
      name: committee.name,
    );

    final result = await _createCommitteeUsecase(manageCommitteeRequest);
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (response) => state = state.copyWith(isLoading: false),
    );

    await getCommittees();
  }

  void selectCommittee(
    BuildContext context,
    ManagementCommittee committee,
  ) async {
    _userSessionNotifier.setCommittee(committee.id, committee.name);
    await Future.wait([
      _sharedPreferences.setString(AppConstants.committeeKey, committee.id),
      _sharedPreferences.setString(
        AppConstants.committeeNameKey,
        committee.name,
      ),
    ]);

    state = state.copyWith(selectedCommittee: committee);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Comité "${committee.name}" seleccionado'),
        duration: const Duration(seconds: 5),
      ),
    );

    GoRouter.of(context).go('/home');
  }
}

final committeesProvider =
    StateNotifierProvider<CommitteesNotifier, CommitteesState>((ref) {
      return CommitteesNotifier(
        ref.watch(getAllCommitteesUseCaseProvider),
        ref.watch(createCommitteeUseCaseProvider),
        ref.watch(sharedPreferencesProvider),
        ref.watch(userSessionProvider.notifier),
      );
    });
