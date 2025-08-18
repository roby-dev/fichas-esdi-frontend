import 'package:fichas_esdi/features/management_committees/domain/entities/management_committee.dart';
import 'package:flutter/material.dart';

class CommitteCard extends StatelessWidget {
  final ManagementCommittee committee;
  final void Function(ManagementCommittee committee) onSelected;

  const CommitteCard({
    super.key,
    required this.committee,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          onSelected(committee);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Código: ${committee.committeeId}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                committee.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
