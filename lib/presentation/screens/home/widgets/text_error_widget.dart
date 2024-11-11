import 'package:currency_conversion/data/data.dart';
import 'package:currency_conversion/presentation/resources/enums.dart';
import 'package:flutter/material.dart';

class TextErrorWidget extends StatelessWidget {
  final String? error;
  final ProgressStatus status;
  const TextErrorWidget({
    super.key,
    required this.error,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    if (error != null && status == ProgressStatus.failure) {
      return Text(
        error!,
        style: const TextStyle(
          color: Colors.redAccent,
        ),
      );
    }
    return const SizedBox();
  }
}
