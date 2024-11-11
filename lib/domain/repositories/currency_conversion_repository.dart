part of '../domain.dart';

abstract class CurrencyConversionRepository {
  Future<CurrencySymbol> getAllCurrencies();

  Future<CurrencyConvertion> convertCurrency({
    required String from,
    required String to,
    required double amount,
  });

  Future<CurrencyQuotes?> getCurrencyQuotes({
    required String base,
    double amount = 1,
  });
}
