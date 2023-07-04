import 'package:multiple_repository/domain/entities/owner_entity.dart';

class OwnerMapper extends OwnerEntity {
  OwnerMapper({
    required int id,
    required String username,
    required String avatar,
    required String ownerRepoLink,
  }) : super(
          id: id,
          avatar: avatar,
          username: username,
          ownerRepoLink: ownerRepoLink,
        );

  static OwnerMapper fromJson(Map<String, dynamic> json) {
    return OwnerMapper(
      id: json['id'] ?? 0,
      username: json['login'] ?? json['display_name'],
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
