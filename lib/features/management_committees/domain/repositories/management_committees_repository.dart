import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/management_committees/domain/entities/create_management_committee_request.dart';
import 'package:fichas_esdi/features/management_committees/domain/entities/management_committee.dart';

abstract class ManagementCommitteesRepository {
  Future<Either<Failure, ManagementCommittee>> createManagementCommittee(
    CreateManagementCommitteeRequest request,
  );
  Future<Either<Failure, List<ManagementCommittee>>> getManagementCommittees();
  Future<Either<Failure, ManagementCommittee>> getManagementCommitteeById(
    String id,
  );
}
