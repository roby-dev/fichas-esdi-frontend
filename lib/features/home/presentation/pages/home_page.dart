import 'package:fichas_esdi/features/children/presentation/providers/children_provider.dart';
import 'package:fichas_esdi/features/home/presentation/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      ref.read(homeProvider.notifier).initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final childrenState = ref.watch(childrenProvider);

    return Column(
      children: [
        const Center(
          child: Text(
            'Bienvenido a Fichas ESDI!',
            style: TextStyle(fontSize: 24),
          ),
        ),
        Center(
          child: Text(
            'Cantidad de niños ${childrenState.childResponse.length}',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }
}
