part of '../domain.dart';

@freezed
class CurrencyQuotes with _$CurrencyQuotes {
  const factory CurrencyQuotes({
    required List<Quote> quotes,
  }) = _CurrencyQuotes;
}
