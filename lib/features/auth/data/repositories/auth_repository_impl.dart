import 'package:fichas_esdi/core/errors/exceptions.dart';
import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:fichas_esdi/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fichas_esdi/features/auth/data/models/login_request_model.dart';
import 'package:fichas_esdi/features/auth/domain/entities/login_request.dart';
import 'package:fichas_esdi/features/auth/domain/entities/login_response.dart';
import 'package:fichas_esdi/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  const AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest request) async {
    try {
      final requestModel = LoginRequestModel.fromEntity(request);
      final response = await remoteDataSource.login(requestModel);

      await localDataSource.saveTokens(
        response.accessToken,
        response.refreshToken,
      );

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await localDataSource.clearTokens();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final token = await localDataSource.getAccessToken();
      return Right(token != null && token.isNotEmpty);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
