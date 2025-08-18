import 'package:fichas_esdi/features/management_committees/domain/entities/management_committee.dart';
import 'package:fichas_esdi/features/management_committees/presentation/providers/management_committees_provider.dart';
import 'package:fichas_esdi/features/management_committees/presentation/widgets/committe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommitteesPage extends ConsumerStatefulWidget {
  const CommitteesPage({super.key});

  @override
  ConsumerState<CommitteesPage> createState() => _CommitteesPageState();
}

class _CommitteesPageState extends ConsumerState<CommitteesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(committeesProvider.notifier).getCommittees();
    });
  }

  @override
  Widget build(BuildContext context) {
    final committeesState = ref.watch(committeesProvider);

    if (committeesState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (committeesState.committeeResponse.isEmpty) {
      return const Center(child: Text("No hay comités registrados"));
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Seleccione un Comité de Gestión',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width < 600
                        ? 1
                        : 3,
                    crossAxisSpacing: 16,
                    childAspectRatio: 7 / 2,
                  ),
                  itemCount: committeesState.committeeResponse.length,
                  itemBuilder: (context, index) {
                    final ManagementCommittee committee =
                        committeesState.committeeResponse[index];
                    return CommitteCard(
                      committee: committee,
                      onSelected: (committee) {
                        ref
                            .read(committeesProvider.notifier)
                            .selectCommittee(context, committee);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
