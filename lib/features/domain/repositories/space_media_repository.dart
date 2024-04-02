import 'package:dartz/dartz.dart';
import 'package:generic_login/core/erros/failures.dart';
import 'package:generic_login/features/domain/entities/space_media_entity.dart';

abstract class ISpaceMediaRepository {
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime dateTime);
}
