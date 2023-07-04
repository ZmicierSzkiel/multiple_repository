import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'package:multiple_repository/core_ui/colors.dart';
import 'package:multiple_repository/core_ui/reset_button.dart';

import 'package:multiple_repository/domain/entities/repository_entity.dart';

import 'package:multiple_repository/presentation/repository_list/bloc/repository_list_bloc.dart';
import 'package:multiple_repository/presentation/repository_list/widgets/repository_list_search_bar.dart';
import 'package:multiple_repository/presentation/repository_list/widgets/repository_list_sortby_dropdown_button.dart';
import 'package:multiple_repository/presentation/repository_list/widgets/repository_list_tile.dart';

class RepositoryListForm extends StatelessWidget {
  final List<RepositoryEntity> repositories;
  final List<String> sortOptions;
  final List<String> searchOptions;
  final String selectedSortOption;
  final LoadingStatus status;

  const RepositoryListForm({
    Key? key,
    required this.repositories,
    required this.sortOptions,
    required this.searchOptions,
    required this.selectedSortOption,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Multiple Repository'),
        centerTitle: true,
      ),
      body: status == LoadingStatus.loading
          ? const Center(
              child: LoadingIndicator(
                indicatorType: Indicator.ballPulse,
                colors: [AppColors.backgroundColor],
              ),
            )
          : status == LoadingStatus.failure
              ? AlertDialog(
                  shadowColor: Colors.grey.withOpacity(0.6),
                  title: const Text('Oops!'),
                  content: const Text(
                    'Something went wrong with the connection, please try again',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<RepositoryListBloc>(context)
                            .add(GetAllRepositoriesEvent());
                      },
                      child: const Text(
                        'Try again',
                      ),
                    ),
                  ],
                )
              : GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: RefreshIndicator(
                    color: AppColors.backgroundColor,
                    onRefresh: () async {
                      BlocProvider.of<RepositoryListBloc>(context)
                          .add(RefreshRepositoriesEvent());
                    },
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 15.0,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: RepositoryListSortByDropdownButton(
                                    selectedSortOption: selectedSortOption,
                                    sortOptions: sortOptions,
                                  ),
                                ),
                                if (selectedSortOption.isNotEmpty)
                                  ResetButton(
                                    onPressed: () async {
                                      BlocProvider.of<RepositoryListBloc>(
                                              context)
                                          .add(
                                        ResetSortRepositoriesEvent(),
                                      );
                                    },
                                  ),
                              ],
                            ),
                            const RepositoryListSearchBar(),
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
                ),
    );
  }
}
