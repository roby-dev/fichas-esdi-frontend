import 'package:fichas_esdi/core/errors/exceptions.dart';
import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/users/data/datasources/users_remote_datasource.dart';
import 'package:fichas_esdi/features/users/data/models/create_user_request_model.dart';
import 'package:fichas_esdi/features/users/data/models/update_roles_request_model.dart';
import 'package:fichas_esdi/features/users/domain/entities/create_user_request.dart';
import 'package:fichas_esdi/features/users/domain/entities/update_roles_request.dart';
import 'package:fichas_esdi/features/users/domain/entities/user.dart';
import 'package:fichas_esdi/features/users/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersRemoteDataSource remoteDataSource;

  const UsersRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> createUser(CreateUserRequest request) async {
    try {
      final requestModel = CreateUserRequestModel.fromEntity(request);
      final response = await remoteDataSource.createUser(requestModel);
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
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      final response = await remoteDataSource.getUsers();
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
  Future<Either<Failure, User>> getUserById(String id) async {
    try {
      final response = await remoteDataSource.getUserById(id);
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
  Future<Either<Failure, User>> updateUserRoles(
    String userId,
    UpdateRolesRequest request,
  ) async {
    try {
      final requestModel = UpdateRolesRequestModel.fromEntity(request);
      final response = await remoteDataSource.updateUserRoles(
        userId,
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
}
