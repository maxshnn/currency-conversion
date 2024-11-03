part of '../domain.dart';

@freezed
class CurrencyConvertion with _$CurrencyConvertion {
  const factory CurrencyConvertion({
    required double result,
    required double rate,
  }) = _CurrencyConvertion;
}
