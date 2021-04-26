import 'package:flutter_test/flutter_test.dart';
import 'package:nba_flutter/features/data/models/team_model.dart';
import 'package:nba_flutter/features/domain/entities/team_entity.dart';
import 'dart:convert';

import '../../mocks/team_mock.dart';

void main() {
  final teamModel = TeamModel(
      id: 30,
      abbreviation: 'WAS',
      city: 'Washington',
      conference: 'East',
      division: 'Southeast',
      fullName: 'Washington Wizards',
      name: 'Wizards');

  test('should be a subclass of TeamEntity', () async {
    expect(teamModel, isA<TeamEntity>());
  });

  test('should return a valid model', () {
    // Arrange
    final Map<String, dynamic> jsonMap = json.decode(teamMock);
    // Act
    final result = TeamModel.fromJson(jsonMap);
    // Assert
    expect(result, teamModel);
  });
  test('should return a json map containing the proper data', () {
    // Arrange
    final expectedMap = {
      "id": 30,
      "abbreviation": "WAS",
      "city": "Washington",
      "conference": "East",
      "division": "Southeast",
      "full_name": "Washington Wizards",
      "name": "Wizards"
    };
    // Act
    final result = teamModel.toJson();
    // Assert
    expect(result, expectedMap);
  });
}
