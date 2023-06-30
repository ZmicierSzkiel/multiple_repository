import 'package:flutter/material.dart';
import 'package:multiple_repository/core_ui/colors.dart';
import 'package:multiple_repository/core_ui/padding.dart';
import 'package:multiple_repository/domain/entities/repository_entity.dart';
import 'package:multiple_repository/presentation/repository_item/repository_item_screen.dart';

class RepositoryListTile extends StatelessWidget {
  final RepositoryEntity repository;

  const RepositoryListTile({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPadding.verticalPadding,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: AppColors.backgroundColor,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: AppPadding.twoSidePaddingS,
        splashColor: AppColors.backgroundColor.withOpacity(0.4),
        leading: SizedBox(
          height: 60.0,
          width: 60.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.network(
              repository.owner.avatar,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.person),
            ),
          ),
        ),
        title: Text(
          repository.title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  repository.description.trim(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    repository.source,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RepositoryItemScreen(
                repository: repository,
              ),
            ),
          );
        },
      ),
    );
  }
}
