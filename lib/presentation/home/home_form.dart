import 'package:flutter/material.dart';
import 'package:multiple_repository/core_ui/colors.dart';

class HomeForm extends StatelessWidget {
  const HomeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Multiple Repository'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListView',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
