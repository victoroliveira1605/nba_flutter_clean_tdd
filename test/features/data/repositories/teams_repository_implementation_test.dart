import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nba_flutter/core/usecase/error/exceptions.dart';
import 'package:nba_flutter/core/usecase/error/failure.dart';
import 'package:nba_flutter/features/data/datasources/teams_datasource.dart';
import 'package:nba_flutter/features/data/models/meta_model.dart';
import 'package:nba_flutter/features/data/models/team_model.dart';
import 'package:nba_flutter/features/data/models/teams_list_model.dart';
import 'package:nba_flutter/features/data/repositories/teams_repository_implementation.dart';

class MockTeamsDatasource extends Mock implements ITeamsDataSource {}

void main() {
  late TeamsRepositoryImplementation repository;
  late ITeamsDataSource datasource;

  setUp(() {
    datasource = MockTeamsDatasource();
    repository = TeamsRepositoryImplementation(datasource);
  });

  final tTeams = TeamsListModel(
      data: [
        TeamModel(
            id: 30,
            abbreviation: 'WAS',
            city: 'Washington',
            conference: 'East',
            division: 'Southeast',
            fullName: 'Washington Wizards',
            name: 'Wizards')
      ],
      meta: MetaModel(
          totalPages: 1,
          currentPage: 1,
          nextPage: 1,
          perPage: 30,
          totalCount: 30));

  test('should return teams nba model when calls the datasource', () async {
    // Arrange
    when(() => datasource.getAllTeams()).thenAnswer((_) async => tTeams);
    // Act
    final result = await repository.getAllTeams();
    // Assert
    expect(result, Right(tTeams));
    verify(() => datasource.getAllTeams()).called(1);
  });

  test(
      'should return a server failure when the call to datasource is unsucessful',
      () async {
    // Arrange
    when(() => datasource.getAllTeams()).thenThrow(ServerException());
    // Act
    final result = await repository.getAllTeams();
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getAllTeams()).called(1);
  });
}
