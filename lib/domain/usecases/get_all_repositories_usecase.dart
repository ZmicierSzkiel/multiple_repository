import 'package:multiple_repository/core/use_case.dart';
import 'package:multiple_repository/domain/entities/repository_entity.dart';
import 'package:multiple_repository/domain/repositories/api_repository.dart';

class GetAllRepositoriesUsecase
    implements UseCase<List<RepositoryEntity>, NoParams> {
  final ApiRepository repository;

  GetAllRepositoriesUsecase({
    required this.repository,
  });

  @override
  Future<List<RepositoryEntity>> execute(NoParams params) async {
    return await repository.getAllRepositories();
  }
}
