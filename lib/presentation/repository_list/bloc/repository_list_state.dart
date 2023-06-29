part of 'repository_list_bloc.dart';

class RepositoryListState {
  final List<RepositoryEntity> repositories;

  RepositoryListState({
    required this.repositories,
  });

  RepositoryListState copyWith({
    List<RepositoryEntity>? repositories,
  }) {
    return RepositoryListState(
      repositories: repositories ?? this.repositories,
    );
  }
}
