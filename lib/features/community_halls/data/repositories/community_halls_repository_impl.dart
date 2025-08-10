import 'package:fichas_esdi/core/errors/exceptions.dart';
import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/community_halls/data/datasources/community_halls_remote_datasource.dart';
import 'package:fichas_esdi/features/community_halls/data/models/create_community_hall_request_model.dart';
import 'package:fichas_esdi/features/community_halls/domain/entities/community_hall.dart';
import 'package:fichas_esdi/features/community_halls/domain/entities/create_community_hall_request.dart';
import 'package:fichas_esdi/features/community_halls/domain/repositories/community_halls_repository.dart';

class CommunityHallsRepositoryImpl implements CommunityHallsRepository {
  final CommunityHallsRemoteDataSource remoteDataSource;

  const CommunityHallsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, CommunityHall>> createCommunityHall(
    CreateCommunityHallRequest request,
  ) async {
    try {
      final requestModel = CreateCommunityHallRequestModel.fromEntity(request);
      final response = await remoteDataSource.createCommunityHall(requestModel);
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
  Future<Either<Failure, List<CommunityHall>>> getCommunityHalls() async {
    try {
      final response = await remoteDataSource.getCommunityHalls();
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
  Future<Either<Failure, CommunityHall>> getCommunityHallById(String id) async {
    try {
      final response = await remoteDataSource.getCommunityHallById(id);
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
  Future<Either<Failure, List<CommunityHall>>> getCommunityHallsByCommitteeId(
    String committeeId,
  ) async {
    try {
      final response = await remoteDataSource.getCommunityHallsByCommitteeId(
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
