import 'package:multiple_repository/data/provider/db_repository_provider.dart';

import 'package:multiple_repository/domain/entities/repository_entity.dart';
import 'package:multiple_repository/domain/repositories/db_repository.dart';

class DbRepositoryImpl extends DbRepository {
  final DbRepositoryProvider _dbRepositoryProvider;

  DbRepositoryImpl({
    required DbRepositoryProvider dbRepositoryProvider,
  }) : _dbRepositoryProvider = dbRepositoryProvider;

  @override
  Future<List<RepositoryEntity>> getAllRepositories() async {
    return await _dbRepositoryProvider.getAllRepositoriesfromDbs();
  }

  @override
  Future<List<RepositoryEntity>> sortRepositories(
    String selectedOption,
  ) async {
    return await _dbRepositoryProvider.sortRepositoriesFromDbs(selectedOption);
  }
}
