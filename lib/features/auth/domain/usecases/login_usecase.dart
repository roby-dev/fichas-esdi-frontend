import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/auth/domain/entities/login_request.dart';
import 'package:fichas_esdi/features/auth/domain/entities/login_response.dart';
import 'package:fichas_esdi/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  const LoginUseCase(this.repository);

  Future<Either<Failure, LoginResponse>> call(LoginRequest request) {
    return repository.login(request);
  }
}
