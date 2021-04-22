import 'package:equatable/equatable.dart';

class Meta extends Equatable {
  final int totalPages;
  final int currentPage;
  final int nextPage;
  final int perPage;
  final int totalCount;

  Meta(
      {required this.totalPages,
      required this.currentPage,
      required this.nextPage,
      required this.perPage,
      required this.totalCount});

  @override
  List<Object?> get props =>
      [totalPages, currentPage, nextPage, perPage, totalCount];
}
