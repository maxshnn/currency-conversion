import 'package:currency_conversion/presentation/helpers/input_formatter_helper.dart';
import 'package:currency_conversion/presentation/resources/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountTextFieldWidget extends StatefulWidget {
  final String labelText;
  final String? value;
  final bool readOnly;
  final ProgressStatus status;
  final Function(String value)? onChanged;
  final TextEditingController? controller;
  const AmountTextFieldWidget({
    super.key,
    required this.labelText,
    this.value,
    this.readOnly = false,
    required this.status,
    this.onChanged,
    this.controller,
  });

  @override
  State<AmountTextFieldWidget> createState() => _AmountTextFieldWidgetState();
}

class _AmountTextFieldWidgetState extends State<AmountTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: widget.readOnly,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
        DoubleInputFormatterHelper()
      ],
      decoration: InputDecoration(
        enabledBorder: _getBorder(),
        focusedBorder: _getBorder(),
        errorBorder: _getBorder(),
        labelText: widget.labelText,
      ),
    );
  }

  UnderlineInputBorder _getBorder() {
    Color color;
    switch (widget.status) {
      case ProgressStatus.failure:
        color = Colors.red;
        break;
      case ProgressStatus.success:
        color = Colors.greenAccent;
        break;
      default:
        color = Colors.grey;
    }
    return UnderlineInputBorder(
      borderSide: BorderSide(color: color, width: 2.0),
    );
  }
}
