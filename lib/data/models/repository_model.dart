import 'package:multiple_repository/domain/entities/owner_entity.dart';
import 'package:multiple_repository/domain/entities/repository_entity.dart';

class RepositoryMapper extends RepositoryEntity {
  RepositoryMapper({
    required int id,
    required String title,
    required String description,
    required OwnerEntity owner,
    required String source,
  }) : super(
          id: id,
          title: title,
          description: description,
          owner: owner,
          source: source,
        );

  static RepositoryMapper fromJson(Map<String, dynamic> json,
      {required String source}) {
    return RepositoryMapper(
      id: json['id'] ?? 0,
      title: json['name'] ?? '',
      description: json['description'] ?? '',
      owner: OwnerMapper.fromJson(json['owner']),
      source: source,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'owner': owner,
        'source': source,
      };
}

class OwnerMapper extends OwnerEntity {
  OwnerMapper({
    required int id,
    required String avatar,
  }) : super(
          id: id,
          avatar: avatar,
        );

  static OwnerMapper fromJson(Map<String, dynamic> json) {
    return OwnerMapper(
      id: json['id'] ?? 0,
      avatar: json['avatar_url'] ?? _parseNestedAvatarFromBitBucket(json),
    );
  }

  static String _parseNestedAvatarFromBitBucket(Map<String, dynamic> json) {
    final Map<String, dynamic> links = json['links'];
    final Map<String, dynamic> avatar = links['avatar'];
    return avatar['href'] ?? '';
  }
}
