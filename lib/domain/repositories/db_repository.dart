import 'package:multiple_repository/domain/entities/repository_entity.dart';

abstract class DbRepository {
  Future<List<RepositoryEntity>> getAllRepositories();
}
