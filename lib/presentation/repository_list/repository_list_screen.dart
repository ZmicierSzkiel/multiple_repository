import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multiple_repository/core/app_locator.dart';

import 'package:multiple_repository/domain/repositories/db_repository.dart';
import 'package:multiple_repository/domain/usecases/get_all_repositories_usecase.dart';
import 'package:multiple_repository/domain/usecases/sort_repositories_usecase.dart';

import 'package:multiple_repository/presentation/repository_list/bloc/repository_list_bloc.dart';
import 'package:multiple_repository/presentation/repository_list/repository_list_form.dart';

class RepositoryListScreen extends StatelessWidget {
  const RepositoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repositoryListBloc = RepositoryListBloc(
      getAllRepositoriesUsecase: GetAllRepositoriesUsecase(
        repository: getIt.get<DbRepository>(),
      ),
      sortRepositoriesUsecase: SortRepositoriesUsecase(
        repository: getIt.get<DbRepository>(),
      ),
    );

    final List<String> sortOptions = repositoryListBloc.getSortOptions();

    return BlocProvider(
      create: (context) => repositoryListBloc
        ..add(
          GetAllRepositoriesEvent(),
        ),
      child: BlocBuilder<RepositoryListBloc, RepositoryListState>(
        builder: (context, state) {
          return RepositoryListForm(
            repositories: state.repositories,
            selectedOption: state.selectedOption,
            sortOptions: sortOptions,
            status: state.status,
          );
        },
      ),
    );
  }
}
