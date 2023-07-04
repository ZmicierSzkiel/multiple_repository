import 'package:multiple_repository/core/use_case.dart';
import 'package:multiple_repository/domain/entities/repository_entity.dart';
import 'package:multiple_repository/domain/entities/search_entity.dart';
import 'package:multiple_repository/domain/repositories/db_repository.dart';

class GetSearchResultUseCase
    implements UseCase<List<RepositoryEntity>, SearchEntity> {
  final DbRepository repository;

  GetSearchResultUseCase({
    required this.repository,
  });

  @override
  Future<List<RepositoryEntity>> execute(SearchEntity params) async {
    return await repository.getSearchResult(params);
  }
}
