part of 'repository_list_bloc.dart';

sealed class RepositoryListEvent {}

final class GetAllRepositoriesEvent extends RepositoryListEvent {}

final class RefreshRepositoriesEvent extends RepositoryListEvent {}

final class SortRepositoriesEvent extends RepositoryListEvent {
  final String selectedOption;

  SortRepositoriesEvent(
    this.selectedOption,
  );
}

final class ResetSortRepositoriesEvent extends RepositoryListEvent {}
