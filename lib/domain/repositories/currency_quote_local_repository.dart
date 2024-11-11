part of '../domain.dart';

abstract class CurrencyQuoteLocalRepository {
  Future<CurrencyQuotes?> getLocalCurrencyQuote({
    required String base,
    double amount = 1,
  });

  Future<void> updateLocalCurrencyQuote({
    required CurrencyQuotes data,
  });
}
