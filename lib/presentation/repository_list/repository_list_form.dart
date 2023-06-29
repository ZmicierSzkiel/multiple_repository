import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multiple_repository/domain/entities/repository_entity.dart';
import 'package:multiple_repository/presentation/repository_list/bloc/repository_list_bloc.dart';
import 'package:multiple_repository/presentation/repository_list/widgets/repository_list_tile.dart';

class RepositoryListForm extends StatelessWidget {
  final List<RepositoryEntity> repositories;
  const RepositoryListForm({
    super.key,
    required this.repositories,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<RepositoryListBloc>().add(RefreshRepositoriesEvent());
      },
      child: SingleChildScrollView(
        child: ListView.builder(
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
      ),
    );
  }
}
