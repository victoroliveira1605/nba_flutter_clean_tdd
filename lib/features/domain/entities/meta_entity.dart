import 'package:equatable/equatable.dart';

class MetaEntity extends Equatable {
  final int totalPages;
  final int currentPage;
  final int nextPage;
  final int perPage;
  final int totalCount;

  MetaEntity(
      {required this.totalPages,
      required this.currentPage,
      required this.nextPage,
      required this.perPage,
      required this.totalCount});

  @override
  List<Object?> get props =>
      [totalPages, currentPage, nextPage, perPage, totalCount];
}
