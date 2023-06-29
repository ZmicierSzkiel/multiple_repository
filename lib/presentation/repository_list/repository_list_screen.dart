import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multiple_repository/core/app_locator.dart';
import 'package:multiple_repository/core_ui/colors.dart';

import 'package:multiple_repository/domain/repositories/db_repository.dart';
import 'package:multiple_repository/domain/usecases/get_all_repositories_usecase.dart';

import 'package:multiple_repository/presentation/repository_list/bloc/repository_list_bloc.dart';
import 'package:multiple_repository/presentation/repository_list/repository_list_form.dart';

class RepositoryListScreen extends StatelessWidget {
  const RepositoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepositoryListBloc(
        getAllRepositoriesUsecase: GetAllRepositoriesUsecase(
          repository: getIt.get<DbRepository>(),
        ),
      )..add(
          GetAllRepositoriesEvent(),
        ),
      child: BlocBuilder<RepositoryListBloc, RepositoryListState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.backgroundColor,
              title: const Text('Multiple Repository'),
              centerTitle: true,
            ),
            body: RepositoryListForm(
              repositories: state.repositories,
            ),
          );
        },
      ),
    );
  }
}
