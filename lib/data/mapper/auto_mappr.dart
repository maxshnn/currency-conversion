import 'package:currency_conversion/data/models/currency_convertion_model.dart';
import 'package:currency_conversion/data/models/currency_symbol_model.dart';
import 'package:currency_conversion/data/models/currensy_quotes_model.dart';
import 'package:currency_conversion/data/models/quote_model.dart';
import 'package:currency_conversion/domain/models/currency_convertion.dart';
import 'package:currency_conversion/domain/models/currency_quotes.dart';
import 'package:currency_conversion/domain/models/currency_symbol.dart';
import 'package:currency_conversion/domain/models/quote.dart';
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import 'auto_mappr.auto_mappr.dart';

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
