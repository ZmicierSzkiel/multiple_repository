import 'package:multiple_repository/data/provider/db_repository_provider.dart';
import 'package:multiple_repository/domain/repositories/db_repository.dart';

class DbRepositoryImpl extends DbRepository {
  final DbRepositoryProvider _dbRepositoryProvider;

  DbRepositoryImpl({
    required DbRepositoryProvider dbRepositoryProvider,
  }) : _dbRepositoryProvider = dbRepositoryProvider;

  @override
  Future<void> getBitBucketData() {
    // TODO: implement getBitBucketData
    throw UnimplementedError();
  }

  @override
  Future<void> getGithubData() {
    // TODO: implement getGithubData
    throw UnimplementedError();
  }
}
