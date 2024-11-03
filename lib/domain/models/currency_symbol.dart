part of '../domain.dart';

@freezed
class CurrencySymbol with _$CurrencySymbol {
  const factory CurrencySymbol({
    required List<String> symbols,
  }) = _CurrencySymbol;
}
