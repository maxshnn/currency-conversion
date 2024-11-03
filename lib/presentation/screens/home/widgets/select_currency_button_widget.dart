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
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          _buildText(context: context),
          _buildIcon(context: context),
        ],
      ),
    );
  }

  Widget _buildIcon({required BuildContext context}) {
    return const Icon(
      size: 30,
      Icons.keyboard_arrow_down_outlined,
      color: Colors.greenAccent,
    );
  }

  Widget _buildText({required BuildContext context}) {
    if (value == null) {
      return const SizedBox(
        width: 20,
      );
    }
    return Text(
      value!,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.greenAccent,
      ),
    );
  }
}
