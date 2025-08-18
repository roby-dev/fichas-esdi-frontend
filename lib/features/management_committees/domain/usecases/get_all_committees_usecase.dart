import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/management_committees/domain/entities/management_committee.dart';
import 'package:fichas_esdi/features/management_committees/domain/repositories/management_committees_repository.dart';

class GetAllCommitteesUsecase {
  final ManagementCommitteesRepository repository;

  const GetAllCommitteesUsecase(this.repository);

  Future<Either<Failure, List<ManagementCommittee>>> call() {
    return repository.getManagementCommittees();
  }
}
