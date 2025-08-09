import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/auth/domain/entities/login_request.dart';
import 'package:fichas_esdi/features/auth/domain/entities/login_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login(LoginRequest request);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, bool>> isLoggedIn();
}
