import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multiple_repository/core_ui/colors.dart';
import 'package:multiple_repository/core_ui/padding.dart';

import 'package:multiple_repository/presentation/repository_list/bloc/repository_list_bloc.dart';

class RepositoryListSearchBar extends StatefulWidget {
  const RepositoryListSearchBar({super.key});

  @override
  State<RepositoryListSearchBar> createState() =>
      _RepositoryListSearchBarState();
}

class _RepositoryListSearchBarState extends State<RepositoryListSearchBar> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.verticalPadding,
      child: TextField(
        controller: controller,
        onChanged: (value) {
          BlocProvider.of<RepositoryListBloc>(context).add(
            GetSearchResultEvent(value),
          );
        },
        decoration: InputDecoration(
          hintText: 'Search by...',
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.backgroundColor,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.backgroundColor,
            ),
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.clear,
            ),
            onPressed: () {
              if (controller.text.isNotEmpty) {
                controller.clear();
                FocusScope.of(context).unfocus();
                BlocProvider.of<RepositoryListBloc>(context).add(
                  ResetSearchResultEvent(),
                );
              }
            },
          ),
          suffixIconColor: AppColors.backgroundColor,
        ),
      ),
    );
  }
}
