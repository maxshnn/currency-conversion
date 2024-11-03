import 'package:flutter/services.dart';

class DoubleInputFormatterHelper extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final RegExp regex =
        RegExp(r'^(0(\.\d{0,2})?)?$|^([1-9]\d*|0)(\.\d{0,2})?$');

    if (regex.hasMatch(newValue.text)) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}
