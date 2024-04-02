import 'package:dartz/dartz.dart';
import 'package:generic_login/core/erros/exeptions.dart';
import 'package:generic_login/core/erros/failures.dart';
import 'package:generic_login/features/data/datasources/space_media_datasource.dart';
import 'package:generic_login/features/domain/entities/space_media_entity.dart';
import 'package:generic_login/features/domain/repositories/space_media_repository.dart';

class SpaceMediaRepositoryImplementation implements ISpaceMediaRepository {
  final ISpaceMediaDatasource datasource;

  SpaceMediaRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime dateTime) async {
    try {
      final result = await datasource.getSpaceMediaFromDate(dateTime);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
