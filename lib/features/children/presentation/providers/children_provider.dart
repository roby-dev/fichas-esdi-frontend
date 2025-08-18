import 'package:fichas_esdi/core/providers/core_providers.dart';
import 'package:fichas_esdi/features/children/data/datasources/children_remote_datasource.dart';
import 'package:fichas_esdi/features/children/data/repositories/children_repository_impl.dart';
import 'package:fichas_esdi/features/children/domain/entities/child.dart';
import 'package:fichas_esdi/features/children/domain/usecases/get_all_children_usecase.dart';
import 'package:fichas_esdi/features/children/domain/repositories/children_repository.dart';
import 'package:fichas_esdi/features/children/domain/usecases/get_child_by_id_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final childrenRemoteDataSourceProvider = Provider<ChildrenRemoteDataSource>(
  (ref) => ChildrenRemoteDataSourceImpl(ref.watch(apiClientProvider)),
);

final childrenRepositoryProvider = Provider<ChildrenRepository>(
  (ref) => ChildrenRepositoryImpl(
    remoteDataSource: ref.watch(childrenRemoteDataSourceProvider),
  ),
);

final getAllChildrenUseCaseProvider = Provider<GetAllChildrenUsecase>(
  (ref) => GetAllChildrenUsecase(ref.watch(childrenRepositoryProvider)),
);

final getChildByIdUseCaseProvider = Provider<GetChildByIdUsecase>(
  (ref) => GetChildByIdUsecase(ref.watch(childrenRepositoryProvider)),
);

class ChildrenState {
  final bool isLoading;
  final List<Child> childResponse;
  final Child? selectedChild;
  final String? errorMessage;

  const ChildrenState({
    this.isLoading = false,
    this.childResponse = const [],
    this.selectedChild,
    this.errorMessage,
  });

  ChildrenState copyWith({
    bool? isLoading,
    List<Child>? childResponse,
    Child? selectedChild,
    bool clearSelectedChild = false,
    String? errorMessage,
  }) {
    return ChildrenState(
      isLoading: isLoading ?? this.isLoading,
      childResponse: childResponse ?? this.childResponse,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedChild: clearSelectedChild
          ? null
          : (selectedChild ?? this.selectedChild),
    );
  }
}

class ChildrenNotifier extends StateNotifier<ChildrenState> {
  final GetAllChildrenUsecase _getAllChildrenUsecase;
  final GetChildByIdUsecase _getChildByIdUsecase;

  ChildrenNotifier(this._getAllChildrenUsecase, this._getChildByIdUsecase)
    : super(const ChildrenState());

  Future<void> getChildren() async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      clearSelectedChild: true,
    );

    final result = await _getAllChildrenUsecase();
    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
      },
      (response) {
        state = state.copyWith(
          isLoading: false,
          childResponse: response,
          errorMessage: null,
        );
      },
    );
  }

  Future<void> getChildById(String id) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      clearSelectedChild: true,
    );
    final result = await _getChildByIdUsecase(id);
    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
      },
      (response) {
        state = state.copyWith(
          isLoading: false,
          selectedChild: response,
          errorMessage: null,
        );
      },
    );
  }

  void clearSelectedChild() {
    state = state.copyWith(selectedChild: null);
  }
}

final childrenProvider = StateNotifierProvider<ChildrenNotifier, ChildrenState>(
  (ref) {
    return ChildrenNotifier(
      ref.watch(getAllChildrenUseCaseProvider),
      ref.watch(getChildByIdUseCaseProvider),
    );
  },
);
