import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nba_flutter/core/usecase/error/failure.dart';
import 'package:nba_flutter/core/usecase/usecase.dart';
import 'package:nba_flutter/features/domain/entities/meta_entity.dart';
import 'package:nba_flutter/features/domain/entities/team_entity.dart';
import 'package:nba_flutter/features/domain/entities/teams_list.dart';
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

  final tTeams = TeamsList(
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
      meta: Meta(
          totalPages: 1,
          currentPage: 1,
          nextPage: 1,
          perPage: 30,
          totalCount: 30));

  test('should get all teams nba', () async {
    when(() => repository.getAllTeams())
        .thenAnswer((_) async => Right<Failure, TeamsList>(tTeams));
    final result = await usecase(NoParams());
    expect(result, Right(tTeams));
    verify(() => repository.getAllTeams()).called(1);
  });
}
