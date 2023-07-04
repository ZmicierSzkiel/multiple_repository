import 'package:multiple_repository/core/use_case.dart';
import 'package:multiple_repository/domain/entities/repository_entity.dart';
import 'package:multiple_repository/domain/repositories/api_repository.dart';

class SortRepositoriesUsecase
    implements UseCase<List<RepositoryEntity>, String> {
  final ApiRepository repository;

  SortRepositoriesUsecase({
    required this.repository,
  });

  @override
  Future<List<RepositoryEntity>> execute(String selectedOption) async {
    return await repository.sortRepositories(selectedOption);
  }
}
