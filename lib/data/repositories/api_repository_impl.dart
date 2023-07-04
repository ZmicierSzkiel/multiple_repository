import 'package:multiple_repository/data/provider/api_repository_provider.dart';

import 'package:multiple_repository/domain/entities/repository_entity.dart';
import 'package:multiple_repository/domain/entities/search_entity.dart';
import 'package:multiple_repository/domain/repositories/api_repository.dart';

class ApiRepositoryImpl extends ApiRepository {
  final ApiRepositoryProvider _apiRepositoryProvider;

  ApiRepositoryImpl({
    required ApiRepositoryProvider apiRepositoryProvider,
  }) : _apiRepositoryProvider = apiRepositoryProvider;

  @override
  Future<List<RepositoryEntity>> getAllRepositories() async {
    return await _apiRepositoryProvider.getAllRepositoriesfromApi();
  }

  @override
  Future<List<RepositoryEntity>> sortRepositories(
    String selectedOption,
  ) async {
    return await _apiRepositoryProvider.sortRepositoriesFromApi(selectedOption);
  }

  @override
  Future<List<RepositoryEntity>> getSearchResult(
    SearchEntity params,
  ) async {
    return await _apiRepositoryProvider.getSearchResultFromApi(params);
  }
}
