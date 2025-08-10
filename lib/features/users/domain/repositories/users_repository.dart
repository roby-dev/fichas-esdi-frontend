import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/users/domain/entities/create_user_request.dart';
import 'package:fichas_esdi/features/users/domain/entities/update_roles_request.dart';
import 'package:fichas_esdi/features/users/domain/entities/user.dart';

abstract class UsersRepository {
  Future<Either<Failure, User>> createUser(CreateUserRequest request);
  Future<Either<Failure, List<User>>> getUsers();
  Future<Either<Failure, User>> getUserById(String id);
  Future<Either<Failure, User>> updateUserRoles(
    String userId,
    UpdateRolesRequest request,
  );
}
