// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'repository_list_bloc.dart';

enum LoadingStatus {
  loading,
  success,
  failure,
}

class RepositoryListState {
  final List<RepositoryEntity> repositories;
  final String selectedOption;
  final LoadingStatus status;
  final String message;

  RepositoryListState({
    required this.repositories,
    required this.selectedOption,
    required this.status,
    required this.message,
  });

  RepositoryListState copyWith({
    List<RepositoryEntity>? repositories,
    String? selectedOption,
    final LoadingStatus? status,
    final String? message,
  }) {
    return RepositoryListState(
      repositories: repositories ?? this.repositories,
      selectedOption: selectedOption ?? this.selectedOption,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
