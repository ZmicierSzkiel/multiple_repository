import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multiple_repository/core/app_locator.dart';

import 'package:multiple_repository/domain/repositories/api_repository.dart';
import 'package:multiple_repository/domain/usecases/get_all_repositories_usecase.dart';
import 'package:multiple_repository/domain/usecases/get_search_result_usecase.dart';
import 'package:multiple_repository/domain/usecases/sort_repositories_usecase.dart';

import 'package:multiple_repository/presentation/repository_list/bloc/repository_list_bloc.dart';
import 'package:multiple_repository/presentation/repository_list/repository_list_form.dart';

class RepositoryListScreen extends StatelessWidget {
  const RepositoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repositoryListBloc = RepositoryListBloc(
      getAllRepositoriesUsecase: GetAllRepositoriesUsecase(
        repository: getIt.get<ApiRepository>(),
      ),
      sortRepositoriesUsecase: SortRepositoriesUsecase(
        repository: getIt.get<ApiRepository>(),
      ),
      getSearchResultUseCase: GetSearchResultUseCase(
        repository: getIt.get<ApiRepository>(),
      ),
    );

    final List<String> sortOptions = repositoryListBloc.getSortOptions();
    final List<String> searchOptions = repositoryListBloc.getSearchOptions();

    return BlocProvider(
      create: (context) => repositoryListBloc
        ..add(
          GetAllRepositoriesEvent(),
        ),
      child: BlocBuilder<RepositoryListBloc, RepositoryListState>(
        builder: (context, state) {
          return RepositoryListForm(
            repositories: state.repositories,
            selectedSortOption: state.selectedSortOption,
            sortOptions: sortOptions,
            searchOptions: searchOptions,
            status: state.status,
          );
        },
      ),
    );
  }
}
