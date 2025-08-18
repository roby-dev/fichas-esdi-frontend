import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/management_committees/domain/entities/create_management_committee_request.dart';
import 'package:fichas_esdi/features/management_committees/domain/entities/management_committee.dart';
import 'package:fichas_esdi/features/management_committees/domain/repositories/management_committees_repository.dart';

class CreateCommitteeUsecase {
  final ManagementCommitteesRepository repository;

  const CreateCommitteeUsecase(this.repository);

  Future<Either<Failure, ManagementCommittee>> call(
    CreateManagementCommitteeRequest request,
  ) {
    return repository.createManagementCommittee(request);
  }
}
