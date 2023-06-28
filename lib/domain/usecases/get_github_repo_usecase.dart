import 'package:multiple_repository/core/use_case.dart';
import 'package:multiple_repository/domain/repositories/db_repository.dart';

class GetGithubRepoUsecase implements UseCase<void, NoParams> {
  final DbRepository repository;

  GetGithubRepoUsecase({
    required this.repository,
  });

  @override
  Future<void> execute(NoParams params) {
    return repository.getGithubData();
  }
}
