import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multiple_repository/core_ui/colors.dart';

import 'package:multiple_repository/presentation/repository_list/bloc/repository_list_bloc.dart';

class RepositoryListResetButton extends StatelessWidget {
  const RepositoryListResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
    );
  }
}
