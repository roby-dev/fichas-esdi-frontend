import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/children/domain/entities/child.dart';
import 'package:fichas_esdi/features/children/domain/entities/create_child_request.dart';

abstract class ChildrenRepository {
  Future<Either<Failure, Child>> createChild(CreateChildRequest request);
  Future<Either<Failure, List<Child>>> getChildren();
}
