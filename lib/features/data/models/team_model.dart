import 'package:nba_flutter/features/domain/entities/team_entity.dart';

class TeamModel extends TeamEntity {
  TeamModel({
    required int id,
    required String abbreviation,
    required String city,
    required String conference,
    required String division,
    required String fullName,
    required String name,
  }) : super(
            id: id,
            abbreviation: abbreviation,
            city: city,
            conference: conference,
            division: division,
            fullName: fullName,
            name: name);

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
        id: json["id"] == null ? null : json["id"],
        abbreviation:
            json["abbreviation"] == null ? null : json["abbreviation"],
        city: json["city"] == null ? null : json["city"],
        conference: json["conference"] == null ? null : json["conference"],
        division: json["division"] == null ? null : json["division"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "abbreviation": abbreviation,
        "city": city,
        "conference": conference,
        "division": division,
        "full_name": fullName,
        "name": name,
      };
}
