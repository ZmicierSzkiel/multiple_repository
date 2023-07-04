import 'package:multiple_repository/domain/entities/repository_entity.dart';
import 'package:multiple_repository/domain/entities/search_entity.dart';

abstract class ApiRepository {
  Future<List<RepositoryEntity>> getAllRepositories();
  Future<List<RepositoryEntity>> sortRepositories(String selectedOption);
  Future<List<RepositoryEntity>> getSearchResult(SearchEntity params);
}
