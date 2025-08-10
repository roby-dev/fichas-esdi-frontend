import 'package:fichas_esdi/core/errors/exceptions.dart';
import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/management_committees/data/datasources/management_committees_remote_datasource.dart';
import 'package:fichas_esdi/features/management_committees/data/models/create_management_committee_request_model.dart';
import 'package:fichas_esdi/features/management_committees/domain/entities/create_management_committee_request.dart';
import 'package:fichas_esdi/features/management_committees/domain/entities/management_committee.dart';
import 'package:fichas_esdi/features/management_committees/domain/repositories/management_committees_repository.dart';

class ManagementCommitteesRepositoryImpl
    implements ManagementCommitteesRepository {
  final ManagementCommitteesRemoteDataSource remoteDataSource;

  const ManagementCommitteesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ManagementCommittee>> createManagementCommittee(
    CreateManagementCommitteeRequest request,
  ) async {
    try {
      final requestModel = CreateManagementCommitteeRequestModel.fromEntity(
        request,
      );
      final response = await remoteDataSource.createManagementCommittee(
        requestModel,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<ManagementCommittee>>>
  getManagementCommittees() async {
    try {
      final response = await remoteDataSource.getManagementCommittees();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ManagementCommittee>> getManagementCommitteeById(
    String id,
  ) async {
    try {
      final response = await remoteDataSource.getManagementCommitteeById(id);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
