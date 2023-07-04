import 'package:flutter/material.dart';

class RepositoryListLazyLoading extends StatefulWidget {
  const RepositoryListLazyLoading({super.key});

  @override
  State<RepositoryListLazyLoading> createState() =>
      _RepositoryListLazyLoadingState();
}

class _RepositoryListLazyLoadingState extends State<RepositoryListLazyLoading> {
  ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
