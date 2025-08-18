import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/children/domain/entities/child.dart';
import 'package:fichas_esdi/features/children/domain/repositories/children_repository.dart';

class GetChildByIdUsecase {
  final ChildrenRepository repository;

  const GetChildByIdUsecase(this.repository);

  Future<Either<Failure, Child>> call(String id) {
    return repository.getChildById(id);
  }
}
