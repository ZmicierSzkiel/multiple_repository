import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multiple_repository/core/app_locator.dart';

import 'package:multiple_repository/domain/usecases/get_all_repositories_usecase.dart';
import 'package:multiple_repository/domain/usecases/get_search_result_usecase.dart';
import 'package:multiple_repository/domain/usecases/sort_repositories_usecase.dart';

import 'package:multiple_repository/presentation/repository_list/bloc/repository_list_bloc.dart';
import 'package:multiple_repository/presentation/repository_list/repository_list_form.dart';

class RepositoryListScreen extends StatelessWidget {
  const RepositoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepositoryListBloc(
        getAllRepositoriesUsecase: getIt<GetAllRepositoriesUsecase>(),
        sortRepositoriesUsecase: getIt<SortRepositoriesUsecase>(),
        getSearchResultUseCase: getIt<GetSearchResultUseCase>(),
      )..add(
          GetAllRepositoriesEvent(),
        ),
      child: const RepositoryListForm(),
    );
  }
}
