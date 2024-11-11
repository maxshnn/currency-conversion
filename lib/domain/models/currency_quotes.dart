import 'package:currency_conversion/domain/models/quote.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'currency_quotes.freezed.dart';

@freezed
class CurrencyQuotes with _$CurrencyQuotes {
  const factory CurrencyQuotes({
    required List<Quote> quotes,
  }) = _CurrencyQuotes;
}
