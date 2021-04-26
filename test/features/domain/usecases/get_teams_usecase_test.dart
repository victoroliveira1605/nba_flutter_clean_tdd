import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nba_flutter/core/usecase/error/failure.dart';
import 'package:nba_flutter/core/usecase/usecase.dart';
import 'package:nba_flutter/features/domain/entities/meta_entity.dart';
import 'package:nba_flutter/features/domain/entities/team_entity.dart';
import 'package:nba_flutter/features/domain/entities/teams_list_entity.dart';
import 'package:nba_flutter/features/domain/repositories/team_repository.dart';
import 'package:nba_flutter/features/domain/usecases/get_teams_usecase.dart';

class MockTeamsRepository extends Mock implements ITeamsRepository {}

void main() {
  late GetTeamsUsecase usecase;
  late ITeamsRepository repository;

  setUp(() {
    repository = MockTeamsRepository();
    usecase = GetTeamsUsecase(repository);
  });

  final tTeams = TeamsListEntity(
      data: [
        TeamEntity(
            id: 30,
            abbreviation: 'WAS',
            city: 'Washington',
            conference: 'East',
            division: 'Southeast',
            fullName: 'Washington Wizards',
            name: 'Wizards')
      ],
      meta: MetaEntity(
          totalPages: 1,
          currentPage: 1,
          nextPage: 1,
          perPage: 30,
          totalCount: 30));

  test('should get all teams nba', () async {
    // Arrange
    when(() => repository.getAllTeams())
        .thenAnswer((_) async => Right<Failure, TeamsListEntity>(tTeams));
    // Act
    final result = await usecase(NoParams());
    expect(result, Right(tTeams));
    // Assert
    verify(() => repository.getAllTeams()).called(1);
  });

  test('should return a ServerFailure when don\'t succeed', () async {
    // Arrange
    when(() => repository.getAllTeams()).thenAnswer(
        (_) async => Left<Failure, TeamsListEntity>(ServerFailure()));
    // Act
    final result = await usecase(NoParams());
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getAllTeams()).called(1);
  });
}
