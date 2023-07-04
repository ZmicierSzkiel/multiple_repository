import 'package:flutter/material.dart';

import 'package:multiple_repository/domain/entities/repository_entity.dart';

import 'package:multiple_repository/presentation/repository_item/repository_item_form.dart';

class RepositoryItemScreen extends StatelessWidget {
  final RepositoryEntity repository;

  const RepositoryItemScreen({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryItemForm(repository: repository);
  }
}
