part of 'repository_list_bloc.dart';

sealed class RepositoryListEvent {}

final class GetAllRepositoriesEvent extends RepositoryListEvent {}

final class RefreshRepositoriesEvent extends RepositoryListEvent {}
