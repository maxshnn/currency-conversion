import 'package:freezed_annotation/freezed_annotation.dart';
part 'currency_symbol.freezed.dart';

@freezed
class CurrencySymbol with _$CurrencySymbol {
  const factory CurrencySymbol({
    required List<String> symbols,
  }) = _CurrencySymbol;
}
