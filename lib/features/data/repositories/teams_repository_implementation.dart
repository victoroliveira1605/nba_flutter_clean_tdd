import 'package:dartz/dartz.dart';
import 'package:nba_flutter/core/usecase/error/exceptions.dart';
import 'package:nba_flutter/core/usecase/error/failure.dart';
import 'package:nba_flutter/features/data/datasources/teams_datasource.dart';
import 'package:nba_flutter/features/domain/entities/teams_list_entity.dart';
import 'package:nba_flutter/features/domain/repositories/team_repository.dart';

class TeamsRepositoryImplementation implements ITeamsRepository {
  final ITeamsDataSource datasource;

  TeamsRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, TeamsListEntity>> getAllTeams() async {
    try {
      final result = await datasource.getAllTeams();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
