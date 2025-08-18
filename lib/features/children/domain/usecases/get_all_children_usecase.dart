import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/children/domain/entities/child.dart';
import 'package:fichas_esdi/features/children/domain/repositories/children_repository.dart';

class GetAllChildrenUsecase {
  final ChildrenRepository repository;

  const GetAllChildrenUsecase(this.repository);

  Future<Either<Failure, List<Child>>> call() {
    return repository.getChildren();
  }
}
