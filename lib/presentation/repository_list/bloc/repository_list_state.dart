part of 'repository_list_bloc.dart';

class RepositoryListState {
  final List<RepositoryEntity> repositories;
  final String selectedOption;

  RepositoryListState({
    required this.repositories,
    required this.selectedOption,
  });

  RepositoryListState copyWith({
    List<RepositoryEntity>? repositories,
    String? selectedOption,
  }) {
    return RepositoryListState(
      repositories: repositories ?? this.repositories,
      selectedOption: selectedOption ?? this.selectedOption,
    );
  }
}
