import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/community_halls/domain/entities/community_hall.dart';
import 'package:fichas_esdi/features/community_halls/domain/entities/create_community_hall_request.dart';

abstract class CommunityHallsRepository {
  Future<Either<Failure, CommunityHall>> createCommunityHall(
    CreateCommunityHallRequest request,
  );
  Future<Either<Failure, List<CommunityHall>>> getCommunityHalls();
  Future<Either<Failure, CommunityHall>> getCommunityHallById(String id);
  Future<Either<Failure, List<CommunityHall>>> getCommunityHallsByCommitteeId(
    String committeeId,
  );
}
