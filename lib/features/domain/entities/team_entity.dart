import 'package:equatable/equatable.dart';

class TeamEntity extends Equatable {
  final int id;
  final String abbreviation;
  final String city;
  final String conference;
  final String division;
  final String fullName;
  final String name;

  TeamEntity(
      {required this.id,
      required this.abbreviation,
      required this.city,
      required this.conference,
      required this.division,
      required this.fullName,
      required this.name});

  @override
  List<Object?> get props =>
      [id, abbreviation, city, conference, division, fullName, name];
}
