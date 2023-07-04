import 'package:flutter/material.dart';

import 'package:multiple_repository/core_ui/colors.dart';
import 'package:multiple_repository/core_ui/padding.dart';

class ResetButton extends StatelessWidget {
  final void Function()? onPressed;

  const ResetButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(
          AppPadding.horizontalPadding10,
        ),
        overlayColor: MaterialStatePropertyAll(
          AppColors.backgroundColor.withOpacity(0.1),
        ),
      ),
      onPressed: onPressed,
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
