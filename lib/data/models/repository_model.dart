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

class OwnerMapper extends OwnerEntity {
  OwnerMapper({
    required int id,
    required String login,
    required String avatar,
    required String ownerRepoLink,
  }) : super(
          id: id,
          avatar: avatar,
          login: login,
          ownerRepoLink: ownerRepoLink,
        );

  static OwnerMapper fromJson(Map<String, dynamic> json) {
    return OwnerMapper(
      id: json['id'] ?? 0,
      login: json['login'] ?? json['display_name'],
      avatar: json['avatar_url'] ?? _parseNestedAvatarFromBitBucket(json),
      ownerRepoLink:
          json['html_url'] ?? _parseNestedRepoLinkFromBitBucket(json),
    );
  }

  static String _parseNestedAvatarFromBitBucket(Map<String, dynamic> json) {
    final Map<String, dynamic> links = json['links'];
    final Map<String, dynamic> avatar = links['avatar'];
    return avatar['href'] ?? '';
  }

  static String _parseNestedRepoLinkFromBitBucket(Map<String, dynamic> json) {
    final Map<String, dynamic> links = json['links'];
    final Map<String, dynamic> html = links['html'];
    return html['href'] ?? '';
  }
}
