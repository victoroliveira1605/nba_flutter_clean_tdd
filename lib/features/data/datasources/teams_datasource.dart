import 'package:nba_flutter/features/data/models/teams_list_model.dart';

abstract class ITeamsDataSource {
  Future<TeamsListModel> getAllTeams();
}
