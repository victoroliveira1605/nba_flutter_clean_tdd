import 'package:nba_flutter/core/usecase/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:nba_flutter/core/usecase/usecase.dart';
import 'package:nba_flutter/features/domain/entities/teams_list.dart';
import 'package:nba_flutter/features/domain/repositories/team_repository.dart';

class GetTeamsUsecase implements Usecase<TeamsList, NoParams> {
  final ITeamsRepository repository;

  GetTeamsUsecase(this.repository);

  @override
  Future<Either<Failure, TeamsList>> call(NoParams params) async {
    return await repository.getAllTeams();
  }
}
