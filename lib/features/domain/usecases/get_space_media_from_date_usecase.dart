import 'package:dartz/dartz.dart';
import 'package:generic_login/core/erros/failures.dart';
import 'package:generic_login/core/usecase/usecase.dart';
import 'package:generic_login/features/domain/entities/space_media_entity.dart';
import 'package:generic_login/features/domain/repositories/space_media_repository.dart';

class GetSpaceMediaFromDateUsecase
    implements Usecase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUsecase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime dateTime) async {
    return await repository.getSpaceMediaFromDate(dateTime);
  }
}
