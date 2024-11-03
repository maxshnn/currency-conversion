part of '../data.dart';

@AutoMappr([
  MapType<CurrencyConvertionModel, CurrencyConvertion>(
    fields: [
      Field('rate', custom: Mappr.fromInfoToDouble),
    ],
  ),
  MapType<CurrencySymbolModel, CurrencySymbol>(
    fields: [
      Field('symbols', from: 'currencies', custom: Mappr.fromMapToString),
    ],
  ),
  MapType<CurrencyQuotesModel, CurrencyQuotes>(reverse: true),
  MapType<QuoteModel, Quote>(reverse: true),
])
class Mappr extends $Mappr {
  static double fromInfoToDouble(CurrencyConvertionModel model) =>
      model.info.rate;

  static List<String> fromMapToString(CurrencySymbolModel model) {
    return model.currencies.entries.map((entry) {
      return entry.key;
    }).toList();
  }
}
