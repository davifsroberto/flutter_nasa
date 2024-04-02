import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:generic_login/core/erros/failures.dart';
import 'package:mocktail/mocktail.dart';
import 'package:generic_login/features/domain/entities/space_media_entity.dart';
import 'package:generic_login/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:generic_login/features/domain/repositories/space_media_repository.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaFromDateUsecase usecase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaFromDateUsecase(repository);
  });

  final tSpaceMedia = SpaceMediaEntity(
    description: 'Fake description',
    mediaType: 'Fake mediaType',
    title: 'Fake title',
    mediaURL: 'Fake mediaURL',
  );

  final tDate = DateTime(2023, 03, 31);
  test('should get space media entity for a given date from the repository',
      () async {
    when(() => repository.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => Right<Failure, SpaceMediaEntity>(tSpaceMedia));

    final result = await usecase.call(tDate);

    expect(result, Right(tSpaceMedia));

    verify(() => repository.getSpaceMediaFromDate(tDate));
  });

  // TODO: implementar outros cenários de teste
}
