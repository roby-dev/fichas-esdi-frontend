import 'package:fichas_esdi/features/children/presentation/providers/children_provider.dart';
import 'package:fichas_esdi/features/children/presentation/widgets/child_card.dart';
import 'package:fichas_esdi/features/shared/ultis/child_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChildrenPage extends ConsumerStatefulWidget {
  const ChildrenPage({super.key});

  @override
  ConsumerState<ChildrenPage> createState() => _ChildrenPageState();
}

class _ChildrenPageState extends ConsumerState<ChildrenPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(childrenProvider.notifier).getChildren();
    });
  }

  @override
  Widget build(BuildContext context) {
    final childrenState = ref.watch(childrenProvider);

    if (childrenState.childResponse.length == 0) {
      return Text('No tiene niños registrados');
    }

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1200,
        ), // ancho máximo del contenido
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width < 600 ? 1 : 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 6 / 3,
          ),
          itemCount: childrenState.childResponse.length,
          itemBuilder: (context, index) {
            final child = childrenState.childResponse[index];
            final props = ChildMapper.toCardProps(child);

            return ChildCard(
              id: child.id,
              codigo: props["codigo"],
              fecha: props["fecha"],
              meses: props["meses"],
              nombre: props["nombre"],
              ingreso: props["ingreso"],
              egreso: props["egreso"],
              aplicable: props["aplicable"],
              aplicableText: props["aplicableText"],
            );
          },
        ),
      ),
    );
  }
}
