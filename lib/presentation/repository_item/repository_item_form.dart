import 'package:flutter/material.dart';
import 'package:multiple_repository/core_ui/colors.dart';
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
        title: Text(repository.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 10.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: Image.network(repository.owner.avatar),
                  ),
                  Text(repository.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
