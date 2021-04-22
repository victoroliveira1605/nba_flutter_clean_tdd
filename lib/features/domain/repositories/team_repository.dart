import 'package:dartz/dartz.dart';
import 'package:nba_flutter/core/usecase/error/failure.dart';
import 'package:nba_flutter/features/domain/entities/teams_list.dart';

abstract class ITeamsRepository {
  Future<Either<Failure, TeamsList>> getAllTeams();
}
