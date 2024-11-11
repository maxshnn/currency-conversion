import 'package:flutter/material.dart';

class AlertDialogCurrencyChoiceWidget extends StatefulWidget {
  final List<String> items;
  final String? value;
  final void Function(String? value) onSubmit;
  const AlertDialogCurrencyChoiceWidget({
    super.key,
    required this.items,
    required this.value,
    required this.onSubmit,
  });

  @override
  State<AlertDialogCurrencyChoiceWidget> createState() =>
      _AlertDialogCurrencyChoiceWidgetState();
}

class _AlertDialogCurrencyChoiceWidgetState
    extends State<AlertDialogCurrencyChoiceWidget> {
  String? selectedValue;

  @override
  void initState() {
    selectedValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: const Text('Choose a currency'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.items.map((currency) {
            return RadioListTile<String>(
              fillColor: const WidgetStatePropertyAll(Colors.green),
              activeColor: Colors.green,
              title: Text(currency),
              value: currency,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            widget.onSubmit(selectedValue);
            Navigator.pop(context);
          },
          child: const Text('ACCEPT'),
        ),
      ],
    );
  }
}
