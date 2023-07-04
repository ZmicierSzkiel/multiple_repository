import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:multiple_repository/core_ui/button.dart';
import 'package:multiple_repository/core_ui/colors.dart';
import 'package:multiple_repository/core_ui/padding.dart';

import 'package:multiple_repository/domain/entities/repository_entity.dart';

class RepositoryItemForm extends StatelessWidget {
  final RepositoryEntity repository;

  const RepositoryItemForm({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Multiple Repository'),
        centerTitle: true,
      ),
      body: Padding(
        padding: AppPadding.twoSidePaddingS,
        child: Column(
          children: [
            Padding(
              padding: AppPadding.verticalPadding,
              child: Center(
                child: SizedBox(
                  height: 150.0,
                  width: 150.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.network(
                      repository.owner.avatar,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.person),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: AppPadding.twoSidePaddingL,
              child: Text(
                repository.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                ),
              ),
            ),
            Padding(
              padding: AppPadding.twoSidePaddingL,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Created by ${repository.owner.username}',
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: AppPadding.twoSidePaddingL,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  repository.description,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: AppPadding.twoSidePaddingL,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppButton(
                    onPressed: () {
                      launchUrl(
                        repository.repoLink.isNotEmpty
                            ? Uri.parse(repository.repoLink)
                            : Uri.parse(repository.owner.ownerRepoLink),
                      );
                    },
                    buttonTitle: 'Repository',
                  ),
                  AppButton(
                    onPressed: () {
                      launchUrl(
                        Uri.parse(repository.owner.ownerRepoLink),
                      );
                    },
                    buttonTitle: 'User Profile',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
