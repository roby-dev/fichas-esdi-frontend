import 'dart:io';

import 'package:fichas_esdi/core/errors/failures.dart';
import 'package:fichas_esdi/core/utils/either.dart';
import 'package:fichas_esdi/features/alert_child/domain/entities/alert_child.dart';
import 'package:fichas_esdi/features/alert_child/domain/entities/bulk_update_response.dart';

abstract class AlertChildRepository {
  Future<Either<Failure, BulkUpdateResponse>> bulkUpdateChildren(
    File file,
    String committeeId,
  );
  Future<Either<Failure, List<AlertChild>>> getAlertChildren();
  Future<Either<Failure, List<AlertChild>>> getAlertChildrenByCommitteeId(
    String committeeId,
  );
}
