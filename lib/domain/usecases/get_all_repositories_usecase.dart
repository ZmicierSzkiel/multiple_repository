import 'package:multiple_repository/core/use_case.dart';
import 'package:multiple_repository/domain/entities/repository_entity.dart';
import 'package:multiple_repository/domain/repositories/db_repository.dart';

class GetAllRepositoriesUsecase
    implements UseCase<List<RepositoryEntity>, NoParams> {
  final DbRepository repository;

  GetAllRepositoriesUsecase({
    required this.repository,
  });

  @override
  Future<List<RepositoryEntity>> execute(NoParams params) {
    return repository.getAllRepositories();
  }
}
