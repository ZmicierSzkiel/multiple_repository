import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multiple_repository/domain/entities/repository_entity.dart';

import 'package:multiple_repository/presentation/repository_item/bloc/repository_item_bloc.dart';
import 'package:multiple_repository/presentation/repository_item/repository_item_form.dart';

class RepositoryItemScreen extends StatelessWidget {
  final RepositoryEntity repository;
  const RepositoryItemScreen({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepositoryItemBloc(),
      child: BlocBuilder<RepositoryItemBloc, RepositoryItemState>(
        builder: (context, state) {
          return RepositoryItemForm(repository: repository);
        },
      ),
    );
  }
}
