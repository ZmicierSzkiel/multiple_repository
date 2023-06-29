import 'package:flutter/material.dart';
import 'package:multiple_repository/core_ui/colors.dart';
import 'package:multiple_repository/domain/entities/repository_entity.dart';

class RepositoryListTile extends StatelessWidget {
  final RepositoryEntity repository;

  const RepositoryListTile({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 5.0,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
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
        onTap: () {},
      ),
    );
  }
}
