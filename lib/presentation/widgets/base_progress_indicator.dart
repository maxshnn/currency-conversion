import 'package:currency_conversion/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class BaseProgressIndicator extends StatelessWidget {
  const BaseProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColors.primaryColor,
    );
  }
}
