import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_repository/core_ui/colors.dart';
import 'package:multiple_repository/presentation/repository_list/bloc/repository_list_bloc.dart';

class RepositoryListDropdownButton extends StatelessWidget {
  final String selectedOption;
  final List<String> sortOptions;

  const RepositoryListDropdownButton({
    super.key,
    required this.selectedOption,
    required this.sortOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: DropdownButton(
        value: selectedOption.isNotEmpty ? selectedOption : null,
        underline: const SizedBox(),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        icon: const Visibility(
          visible: false,
          child: Icon(Icons.arrow_downward),
        ),
        hint: const Text(
          'Sort by',
          style: TextStyle(
            color: AppColors.backgroundTextColor,
          ),
        ),
        dropdownColor: AppColors.backgroundColor,
        items: sortOptions.map(
          (option) {
            return DropdownMenuItem(
              alignment: Alignment.center,
              value: option,
              child: Text(
                option,
                style: const TextStyle(
                  color: AppColors.backgroundTextColor,
                ),
              ),
            );
          },
        ).toList(),
        onChanged: (value) {
          BlocProvider.of<RepositoryListBloc>(context)
              .add(SortRepositoriesEvent(value!));
        },
      ),
    );
  }
}
