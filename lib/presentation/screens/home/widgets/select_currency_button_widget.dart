import 'package:currency_conversion/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class SelectCurrencyButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String? value;
  const SelectCurrencyButtonWidget(
      {super.key, required this.onPressed, this.value});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        elevation: WidgetStatePropertyAll(0),
        backgroundColor: WidgetStatePropertyAll(
          Colors.transparent,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          value == null
              ? const SizedBox(
                  width: 20,
                )
              : Text(
                  value ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
          const Icon(
            size: 30,
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
