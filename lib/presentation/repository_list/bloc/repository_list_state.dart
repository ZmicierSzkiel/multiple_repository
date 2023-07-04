part of 'repository_list_bloc.dart';

enum LoadingStatus {
  loading,
  success,
  failure,
}

class RepositoryListState {
  final List<RepositoryEntity> repositories;
  final String selectedSortOption;
  final LoadingStatus status;
  final String message;
  final String searchValue;

  RepositoryListState({
    required this.repositories,
    required this.selectedSortOption,
    required this.status,
    required this.message,
    required this.searchValue,
  });

  RepositoryListState copyWith({
    List<RepositoryEntity>? repositories,
    String? selectedSortOption,
    LoadingStatus? status,
    String? message,
    String? searchValue,
  }) {
    return RepositoryListState(
      repositories: repositories ?? this.repositories,
      selectedSortOption: selectedSortOption ?? this.selectedSortOption,
      status: status ?? this.status,
      message: message ?? this.message,
      searchValue: searchValue ?? this.searchValue,
    );
  }
}
