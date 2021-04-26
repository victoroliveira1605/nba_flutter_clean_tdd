import 'package:nba_flutter/features/domain/entities/meta_entity.dart';

class MetaModel extends MetaEntity {
  MetaModel({
    required int totalPages,
    required int currentPage,
    required int nextPage,
    required int perPage,
    required int totalCount,
  }) : super(
            totalPages: totalPages,
            currentPage: currentPage,
            nextPage: nextPage,
            perPage: perPage,
            totalCount: totalCount);

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        currentPage: json["current_page"] == null ? null : json["current_page"],
        nextPage: json["next_page"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        totalCount: json["total_count"] == null ? null : json["total_count"],
      );

  Map<String, dynamic> toJson() => {
        "total_pages": totalPages,
        "current_page": currentPage,
        "next_page": nextPage,
        "per_page": perPage,
        "total_count": totalCount,
      };
}
