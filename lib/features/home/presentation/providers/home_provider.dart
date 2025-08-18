import 'package:fichas_esdi/features/children/presentation/providers/children_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  final bool isLoading;

  const HomeState({this.isLoading = false});

  HomeState copyWith({bool? isLoading}) {
    return HomeState(isLoading: isLoading ?? this.isLoading);
  }
}

class HomeNotifier extends StateNotifier<HomeState> {
  final Ref _ref;

  HomeNotifier(this._ref) : super(const HomeState());

  Future<void> initData() async {
    state = state.copyWith(isLoading: true);

    try {
      await Future.wait([_ref.read(childrenProvider.notifier).getChildren()]);
    } catch (_) {}

    state = state.copyWith(isLoading: false);
  }
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(ref);
});
