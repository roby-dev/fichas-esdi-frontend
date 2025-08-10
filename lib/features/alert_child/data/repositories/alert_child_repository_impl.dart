import 'dart:io';

import 'package:fichas_esdi/core/errors/exceptions.dart';
import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/alert_child/data/datasources/alert_child_remote_datasource.dart';
import 'package:fichas_esdi/features/alert_child/domain/entities/alert_child.dart';
import 'package:fichas_esdi/features/alert_child/domain/entities/bulk_update_response.dart';
import 'package:fichas_esdi/features/alert_child/domain/repositories/alert_child_repository.dart';

class AlertChildRepositoryImpl implements AlertChildRepository {
  final AlertChildRemoteDataSource remoteDataSource;

  const AlertChildRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, BulkUpdateResponse>> bulkUpdateChildren(
    File file,
    String committeeId,
  ) async {
    try {
      final response = await remoteDataSource.bulkUpdateChildren(
        file,
        committeeId,
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
  Future<Either<Failure, List<AlertChild>>> getAlertChildren() async {
    try {
      final response = await remoteDataSource.getAlertChildren();
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
  Future<Either<Failure, List<AlertChild>>> getAlertChildrenByCommitteeId(
    String committeeId,
  ) async {
    try {
      final response = await remoteDataSource.getAlertChildrenByCommitteeId(
        committeeId,
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
}
