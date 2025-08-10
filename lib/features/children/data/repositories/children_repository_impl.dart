import 'package:fichas_esdi/core/errors/exceptions.dart';
import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/children/data/datasources/children_remote_datasource.dart';
import 'package:fichas_esdi/features/children/data/models/create_child_request_model.dart';
import 'package:fichas_esdi/features/children/domain/entities/child.dart';
import 'package:fichas_esdi/features/children/domain/entities/create_child_request.dart';
import 'package:fichas_esdi/features/children/domain/repositories/children_repository.dart';

class ChildrenRepositoryImpl implements ChildrenRepository {
  final ChildrenRemoteDataSource remoteDataSource;

  const ChildrenRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Child>> createChild(CreateChildRequest request) async {
    try {
      final requestModel = CreateChildRequestModel.fromEntity(request);
      final response = await remoteDataSource.createChild(requestModel);
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
  Future<Either<Failure, List<Child>>> getChildren() async {
    try {
      final response = await remoteDataSource.getChildren();
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
