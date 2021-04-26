import 'package:equatable/equatable.dart';
import 'package:nba_flutter/features/domain/entities/meta_entity.dart';
import 'package:nba_flutter/features/domain/entities/team_entity.dart';

class TeamsListEntity extends Equatable {
  final List<TeamEntity> data;
  final MetaEntity meta;

  TeamsListEntity({required this.data, required this.meta});

  @override
  List<Object?> get props => [data, meta];
}
