// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:currency_conversion/core/di/di.dart';
import 'package:currency_conversion/data/data.dart';
import 'package:currency_conversion/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setDependencyInjection();

  test(
    'currencyConversionRepository',
    () async {
      CurrencyConversionRepository currencyConversionRepository =
          CurrencyConversionRepositoryImpl(
        currencyConversionService: injection(),
        mapper: injection(),
      );

      var data = await currencyConversionRepository.getCurrencyQuotes(
          base: 'USD', amount: 1);
      expect(data?.quotes ?? [], isNotEmpty);
    },
  );
}
