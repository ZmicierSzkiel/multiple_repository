import 'package:flutter/material.dart';
import 'package:multiple_repository/core_ui/colors.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonTitle;

  const AppButton({
    super.key,
    this.onPressed,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(
          AppColors.backgroundColor,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Text(buttonTitle),
      ),
    );
  }
}
