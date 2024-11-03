import 'package:flutter/material.dart';

class ConvertButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const ConvertButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      iconSize: 35,
      icon: Icon(
        Icons.currency_exchange,
        color: Colors.grey[700],
      ),
    );
  }
}
