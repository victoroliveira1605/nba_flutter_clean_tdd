import 'package:nba_flutter/core/usecase/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:nba_flutter/core/usecase/usecase.dart';
import 'package:nba_flutter/features/domain/entities/teams_list_entity.dart';
import 'package:nba_flutter/features/domain/repositories/team_repository.dart';

class GetTeamsUsecase implements Usecase<TeamsListEntity, NoParams> {
  final ITeamsRepository repository;

  GetTeamsUsecase(this.repository);

  @override
  Future<Either<Failure, TeamsListEntity>> call(NoParams params) async {
    return await repository.getAllTeams();
  }
}
