import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multiple_repository/core_ui/colors.dart';

import 'package:multiple_repository/domain/entities/repository_entity.dart';

import 'package:multiple_repository/presentation/repository_list/bloc/repository_list_bloc.dart';
import 'package:multiple_repository/presentation/repository_list/widgets/repository_list_dropdown_button.dart';
import 'package:multiple_repository/presentation/repository_list/widgets/repository_list_tile.dart';

class RepositoryListForm extends StatelessWidget {
  final List<RepositoryEntity> repositories;
  final List<String> sortOptions;
  final String selectedOption;

  const RepositoryListForm({
    super.key,
    required this.repositories,
    required this.selectedOption,
    required this.sortOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Multiple Repository'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<RepositoryListBloc>(context)
              .add(RefreshRepositoriesEvent());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RepositoryListDropdownButton(
                      selectedOption: selectedOption,
                      sortOptions: sortOptions,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 10.0),
                        ),
                        overlayColor: MaterialStatePropertyAll(
                          AppColors.backgroundColor.withOpacity(0.1),
                        ),
                      ),
                      onPressed: () async {
                        BlocProvider.of<RepositoryListBloc>(context)
                            .add(ResetSortRepositoriesEvent());
                      },
                      child: const Row(
                        children: [
                          Text(
                            'Reset',
                            style: TextStyle(
                              color: AppColors.backgroundColor,
                            ),
                          ),
                          Icon(
                            Icons.close,
                            color: AppColors.backgroundColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: repositories.length,
                  itemBuilder: (context, index) {
                    final itemIndex = index % repositories.length;
                    return RepositoryListTile(
                      repository: repositories[itemIndex],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
