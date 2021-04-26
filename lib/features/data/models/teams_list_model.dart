import 'package:nba_flutter/features/data/models/meta_model.dart';
import 'package:nba_flutter/features/data/models/team_model.dart';
import 'package:nba_flutter/features/domain/entities/teams_list_entity.dart';

class TeamsListModel extends TeamsListEntity {
  TeamsListModel({
    required List<TeamModel> data,
    required MetaModel meta,
  }) : super(data: data, meta: meta);

  factory TeamsListModel.fromJson(Map<String, dynamic> json) => TeamsListModel(
        data: json["data"].map((x) => TeamModel.fromJson(x)),
        meta: MetaModel.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<TeamModel>.from(data.map((x) => x)),
        "meta": meta,
      };
}
