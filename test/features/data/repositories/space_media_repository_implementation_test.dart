import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:generic_login/core/erros/exeptions.dart';
import 'package:generic_login/core/erros/failures.dart';
import 'package:generic_login/features/data/datasources/space_media_datasource.dart';
import 'package:generic_login/features/data/models/space_media_model.dart';
import 'package:generic_login/features/data/repositories/space_media_repository_implementation.dart';
import 'package:mocktail/mocktail.dart';

class MockSpaceMediaDatasource extends Mock implements ISpaceMediaDatasource {}

void main() {
  late SpaceMediaRepositoryImplementation repository;
  late ISpaceMediaDatasource datasource;

  setUp(() {
    datasource = MockSpaceMediaDatasource();
    repository = SpaceMediaRepositoryImplementation(datasource);
  });

  final tSpaceMediaModel = SpaceMediaModel(
    description: 'Fake description',
    mediaType: 'Fake mediaType',
    title: 'Fake title',
    mediaURL: 'Fake mediaURL',
  );

  final tDate = DateTime(2023, 04, 01);
  test('should return space media model when calls the datasource', () async {
    when(() => datasource.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => tSpaceMediaModel);

    final result = await repository.getSpaceMediaFromDate(tDate);

    expect(result, Right(tSpaceMediaModel));

    verify(() => datasource.getSpaceMediaFromDate(tDate)).called(1);
  });

  test(
      'should return a server failure when the call to datasource is unsucessful',
      () async {
    when(() => datasource.getSpaceMediaFromDate(any()))
        .thenThrow(ServerException());

    final result = await repository.getSpaceMediaFromDate(tDate);

    expect(result, Left(ServerFailure()));
    verify(() => datasource.getSpaceMediaFromDate(tDate)).called(1);
  });
}
