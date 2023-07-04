import 'package:multiple_repository/data/models/owner_model.dart';

import 'package:multiple_repository/domain/entities/owner_entity.dart';
import 'package:multiple_repository/domain/entities/repository_entity.dart';

class RepositoryMapper extends RepositoryEntity {
  RepositoryMapper({
    required int id,
    required String title,
    required String description,
    required OwnerEntity owner,
    required String source,
    required String repoLink,
  }) : super(
          id: id,
          title: title,
          description: description,
          owner: owner,
          source: source,
          repoLink: repoLink,
        );

  static RepositoryMapper fromJson(
    Map<String, dynamic> json, {
    required String source,
  }) {
    return RepositoryMapper(
      id: json['id'] ?? 0,
      title: json['name'] ?? '',
      description: json['description'] ?? '',
      source: source,
      repoLink: json['html_url'] ?? '',
      owner: OwnerMapper.fromJson(json['owner']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'owner': owner,
        'source': source,
        'repoLink': repoLink,
      };
}
