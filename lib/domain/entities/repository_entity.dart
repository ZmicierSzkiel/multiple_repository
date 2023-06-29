import 'package:multiple_repository/domain/entities/owner_entity.dart';

class RepositoryEntity {
  final int id;
  final String title;
  final String description;
  final OwnerEntity owner;
  final String source;

  RepositoryEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.owner,
    required this.source,
  });
}
